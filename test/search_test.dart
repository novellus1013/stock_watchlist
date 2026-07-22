import 'package:flutter_test/flutter_test.dart';
import 'package:stock_watchlist/features/search/index/linear_index.dart';

import 'fixture_loader.dart';

void main() {
  final stocks = loadStocks();
  final index = LinearSearchIndex(stocks);

  List<String> names(String q) => index.search(q).map((s) => s.name).toList();

  test('픽스처가 전 종목을 담고 있다', () {
    expect(stocks.length, greaterThan(2000));
  });

  test('종목명 부분 문자열로 찾는다', () {
    expect(names('성전'), containsAll(['삼성전자', '삼성전기']));
  });

  test('정규화가 필요한 이름을 찾는다', () {
    expect(names('ktg'), contains('KT&G'));
    expect(names('soil'), contains('S-Oil'));
    expect(names('lselectric'), contains('LS ELECTRIC'));
  });

  test('종목코드 완전일치가 맨 앞에 온다', () {
    expect(index.search('005930').first.name, '삼성전자');
  });

  test('빈 질의는 전체를 돌려준다', () {
    expect(index.search('').length, stocks.length);
    expect(index.search('   ').length, stocks.length);
  });
}
