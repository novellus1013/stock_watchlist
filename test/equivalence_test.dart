import 'package:flutter_test/flutter_test.dart';
import 'package:stock_watchlist/features/market/model/stock.dart';
import 'package:stock_watchlist/features/search/index/linear_index.dart';
import 'package:stock_watchlist/features/search/index/ngram_index.dart';
import 'package:stock_watchlist/features/search/index/normalize.dart';

import 'fixture_loader.dart';

/// 정답지. 색인도 선형 구현도 참조하지 않는 독립 함수.
/// 두 구현이 같은 로직을 공유하면 그 로직이 틀렸을 때 둘 다 같은 오답을 낸다.
List<Stock> scanByName(List<Stock> all, String query) {
  final q = normalize(query);
  return [
    for (final s in all)
      if (normalize(s.name).contains(q)) s,
  ];
}

final _digits = RegExp(r'^\d+$');

/// 실제 종목명에서 2~4글자 추출해서 확인
List<String> buildQueries(List<Stock> stocks) {
  final out = <String>{
    '삼성',
    '성전',
    '전자',
    '하이닉스',
    '홀딩스',
    '바이오',
    '에스',
    'sk',
    'lg',
    'cj',
    'ktg',
    'soil',
    'lselectric',
    'jypent',
    '우선주',
    '리츠',
    '스팩',
    'zzzz',
    '없는이름',
  };

  for (var i = 0; i < stocks.length; i += 30) {
    final name = normalize(stocks[i].name);
    for (final len in const [2, 3, 4]) {
      if (name.length < len) continue;
      final start = (i ~/ 30) % (name.length - len + 1);
      out.add(name.substring(start, start + len));
    }
  }

  return out.where((q) => !_digits.hasMatch(q)).toList();
}

void main() {
  final stocks = loadStocks();
  final ngram = NgramIndex(stocks);
  final linear = LinearSearchIndex(stocks);

  test('색인이 정답지와 같은 결과를 낸다', () {
    final queries = buildQueries(stocks);
    expect(queries.length, greaterThan(80), reason: '질의가 너무 적다');

    for (final q in queries) {
      final expected = scanByName(stocks, q).map((s) => s.code).toSet();
      final actual = ngram.search(q).map((s) => s.code).toSet();
      expect(actual, expected, reason: '질의: "$q"');
    }
  });

  test('결과에 중복이 없다', () {
    for (final q in ['삼성', '에스', '전자', '홀딩스']) {
      final codes = ngram.search(q).map((s) => s.code).toList();
      expect(codes.length, codes.toSet().length, reason: '질의: "$q"');
    }
  });

  test('한 글자 질의도 정답지와 같다', () {
    for (final q in ['삼', '전', 's', 'k', '우']) {
      final expected = scanByName(stocks, q).map((s) => s.code).toSet();
      final actual = ngram.search(q).map((s) => s.code).toSet();
      expect(actual, expected, reason: '질의: "$q"');
    }
  });

  test('빈 질의는 전체를 낸다', () {
    expect(ngram.search('').length, stocks.length);
    expect(ngram.search('   ').length, stocks.length);
  });

  test('숫자 질의는 선형 구현과 같다', () {
    // 정답지(이름 contains)로는 검증할 수 없는 분기다.
    // 코드 완전일치 → 부분일치 → 0건이면 이름 검색으로 폴백하는 규칙을
    // 두 구현이 똑같이 따르는지만 본다.
    for (final q in ['005930', '0059', '4', '12', '900110', '999999']) {
      expect(
        ngram.search(q).map((s) => s.code).toList(),
        linear.search(q).map((s) => s.code).toList(),
        reason: '질의: "$q"',
      );
    }
  });

  test('색인 통계', () {
    final s = ngram.stats;
    print('종목        ${stocks.length}');
    print('포스팅      ${s.postings}');
    print('고유 bigram ${s.uniqueGrams}');
    print('최대 포스팅 ${s.maxPosting} (${s.maxGram})');
    print('평균 포스팅 ${(s.postings / s.uniqueGrams).toStringAsFixed(2)}');

    expect(s.uniqueGrams, greaterThan(1000));
  });
}
