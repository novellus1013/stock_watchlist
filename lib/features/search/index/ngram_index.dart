import 'package:stock_watchlist/features/market/model/stock.dart';

import 'normalize.dart';
import 'search_index.dart';

/// "삼성전자" → {삼성, 성전, 전자}
Set<String> bigrams(String s) {
  if (s.isEmpty) return const {};
  if (s.length < 2) return {s};
  return {for (var i = 0; i < s.length - 1; i++) s.substring(i, i + 2)};
}

String _defaultKey(Stock s) => normalize(s.name);

class NgramIndex implements StockSearchIndex {
  NgramIndex(List<Stock> stocks, {String Function(Stock)? keyOf})
    : _stocks = List.unmodifiable(stocks),
      _keyOf = keyOf ?? _defaultKey {
    for (var i = 0; i < _stocks.length; i++) {
      final s = _stocks[i];
      _byCode[s.code] = i;
      _keys.add(_keyOf(s));
      // i가 오름차순이므로 포스팅 리스트는 자동으로 정렬된 상태
      for (final g in bigrams(_keys[i])) {
        _index.putIfAbsent(g, () => <int>[]).add(i);
      }
    }
  }

  final List<Stock> _stocks;
  final String Function(Stock) _keyOf;

  /// 정규화 결과를 미리 만들어 둠 -> 검색마다 2,872번 normalize를 다시 돌지 않기 위함
  final List<String> _keys = [];

  /// bigram → 포스팅 리스트(원본 위치)
  final Map<String, List<int>> _index = {};

  /// 코드 → 위치
  final Map<String, int> _byCode = {};

  static final _digits = RegExp(r'^\d+$');

  @override
  List<Stock> search(String raw) {
    final q = normalize(raw);
    if (q.isEmpty) return _stocks;

    // 숫자만이면 코드로 먼저. 코드에 없으면 이름에 숫자가 든 종목 -> 그대로 이름 검색 (CJ4우, 대유플러스 12WR)
    if (_digits.hasMatch(q)) {
      final hits = searchByCode(q);
      if (hits.isNotEmpty) return hits;
    }

    // 1글자는 색인에 키가 없다 → 선형 검색
    if (q.length < 2) return _scanByName(q);

    final lists = <List<int>>[];
    for (final g in bigrams(q)) {
      final posting = _index[g];
      if (posting == null) return const [];
      lists.add(posting);
    }

    // 짧은 리스트부터
    lists.sort((a, b) => a.length.compareTo(b.length));

    var candidates = lists.first;
    for (var i = 1; i < lists.length && candidates.isNotEmpty; i++) {
      candidates = _intersect(candidates, lists[i]);
    }

    return [
      for (final i in candidates)
        if (_keys[i].contains(q)) _stocks[i],
    ];
  }

  /// 두 정렬된 리스트의 교집합. 양쪽을 한 번씩만 확인
  static List<int> _intersect(List<int> a, List<int> b) {
    final out = <int>[];
    var i = 0;
    var j = 0;
    while (i < a.length && j < b.length) {
      final x = a[i];
      final y = b[j];
      if (x == y) {
        out.add(x);
        i++;
        j++;
      } else if (x < y) {
        i++;
      } else {
        j++;
      }
    }
    return out;
  }

  List<Stock> searchByCode(String q) {
    final exact = _byCode[q];
    return [
      if (exact != null) _stocks[exact],
      for (final s in _stocks)
        if (s.code != q && s.code.contains(q)) s,
    ];
  }

  List<Stock> _scanByName(String q) => [
    for (var i = 0; i < _stocks.length; i++)
      if (_keys[i].contains(q)) _stocks[i],
  ];

  /// 벤치마크·README용 통계
  ({int postings, int uniqueGrams, int maxPosting, String maxGram}) get stats {
    var postings = 0;
    var maxPosting = 0;
    var maxGram = '';
    _index.forEach((gram, list) {
      postings += list.length;
      if (list.length > maxPosting) {
        maxPosting = list.length;
        maxGram = gram;
      }
    });
    return (
      postings: postings,
      uniqueGrams: _index.length,
      maxPosting: maxPosting,
      maxGram: maxGram,
    );
  }
}
