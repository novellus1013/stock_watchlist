import 'package:flutter_test/flutter_test.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';
import 'package:stock_watchlist/features/market/model/stock.dart';
import 'package:stock_watchlist/features/search/index/linear_index.dart';
import 'package:stock_watchlist/features/search/index/ranking.dart';

import 'fixture_loader.dart';

Quote _quote(String code, int cap) => Quote(
  date: '20260721',
  code: code,
  close: 1,
  change: 0,
  changeRate: 0,
  volume: 0,
  marketCap: cap,
);

void main() {
  group('순수 로직', () {
    test('완전일치 > 접두사 > 부분일치', () {
      const partial = Stock(code: '000001', name: '가나');
      const prefix = Stock(code: '000002', name: '나다');
      const exact = Stock(code: '000003', name: '나');

      final sorted = rank([partial, prefix, exact], '나', const {});

      expect(sorted.map((s) => s.name), ['나', '나다', '가나']);
    });

    test('동점이면 시가총액이 큰 쪽이 앞', () {
      const small = Stock(code: '000001', name: '나가');
      const big = Stock(code: '000002', name: '나다');

      final sorted = rank(
        [small, big],
        '나',
        {'000001': _quote('000001', 100), '000002': _quote('000002', 900)},
      );

      expect(sorted.first.name, '나다');
    });

    test('빈 질의는 시가총액 순', () {
      const a = Stock(code: '000001', name: '가');
      const b = Stock(code: '000002', name: '나');

      final sorted = rank(
        [a, b],
        '',
        {'000001': _quote('000001', 100), '000002': _quote('000002', 900)},
      );

      expect(sorted.first.code, '000002');
    });

    test('시세가 없어도 순서가 정해진다', () {
      const a = Stock(code: '000001', name: '나');
      const b = Stock(code: '000002', name: '나다');

      expect(rank([a, b], '나', const {}).first.name, '나');
    });
  });

  group('실제 데이터', () {
    final stocks = loadStocks();
    final quotes = loadQuotes();
    final index = LinearSearchIndex(stocks);

    List<Stock> ranked(String q) => rank(index.search(q), q, quotes);

    test('삼성 → 삼성전자가 최상단', () {
      expect(ranked('삼성').first.name, '삼성전자');
    });

    test('종목명 완전일치가 접두사보다 앞', () {
      expect(ranked('삼성전자').first.name, '삼성전자');
    });

    test('종목코드 완전일치가 최상단', () {
      expect(ranked('005930').first.name, '삼성전자');
    });
  });
}
