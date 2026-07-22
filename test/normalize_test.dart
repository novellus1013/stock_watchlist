import 'package:flutter_test/flutter_test.dart';
import 'package:stock_watchlist/features/search/index/normalize.dart';

void main() {
  test('실제 종목명을 정규화한다', () {
    expect(normalize('KT&G'), 'ktg');
    expect(normalize('S-Oil'), 'soil');
    expect(normalize('LS ELECTRIC'), 'lselectric');
    expect(normalize('신세계 I&C'), '신세계ic');
    expect(normalize('JYP Ent.'), 'jypent');
    expect(normalize('CJ4우(전환)'), 'cj4우전환');
    expect(normalize('와이지-원'), '와이지원');
    expect(normalize('SM Life Design'), 'smlifedesign');
  });

  test('질의와 종목명이 같은 결과로 모인다', () {
    expect(normalize('kt g'), normalize('KT&G'));
    expect(normalize('  S Oil  '), normalize('S-Oil'));
  });

  test('한 번 더 통과시켜도 결과가 같다', () {
    expect(normalize(normalize('KT&G')), normalize('KT&G'));
  });
}
