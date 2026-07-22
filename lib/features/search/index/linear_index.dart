import 'package:stock_watchlist/features/market/model/stock.dart';

import 'normalize.dart';
import 'search_index.dart';

/// 선형 탐색 구현
class LinearSearchIndex implements StockSearchIndex {
  LinearSearchIndex(List<Stock> stocks) : _stocks = List.unmodifiable(stocks) {
    for (var i = 0; i < _stocks.length; i++) {
      _byCode[_stocks[i].code] = i;
    }
  }

  final List<Stock> _stocks;
  final Map<String, int> _byCode = {};

  static final _digits = RegExp(r'^\d+$');

  @override
  List<Stock> search(String raw) {
    final q = normalize(raw);
    if (q.isEmpty) return _stocks;

    // 숫자만 있으면 종목코드. 코드에 없으면 이름에 숫자가 든 종목일 수 있음
    if (_digits.hasMatch(q)) {
      final hits = searchByCode(q);
      if (hits.isNotEmpty) return hits;
    }

    return _searchByName(q);
  }

  // 완전일치는 Map으로 O(1), 부분일치는 선형.
  List<Stock> searchByCode(String q) {
    final exact = _byCode[q];
    return [
      if (exact != null) _stocks[exact],
      for (final s in _stocks)
        if (s.code != q && s.code.contains(q)) s,
    ];
  }

  List<Stock> _searchByName(String q) => [
    for (final s in _stocks)
      if (normalize(s.name).contains(q)) s,
  ];
}
