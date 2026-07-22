import 'package:flutter_test/flutter_test.dart';
import 'package:stock_watchlist/features/search/index/linear_index.dart';
import 'package:stock_watchlist/features/search/index/ngram_index.dart';
import 'package:stock_watchlist/features/search/index/search_index.dart';

import 'fixture_loader.dart';

const _queries = ['삼성', '성전', '전자', '하이닉스', 'ktg', '에스', '홀딩스'];
const _n = 2000;

// 첫 호출이 유독 느리게 잡히는 것을 막기 위해 측정 전에 같은 코드를 몇 번 돌려보기
void _warmUp(StockSearchIndex index) {
  for (var i = 0; i < 200; i++) {
    index.search(_queries[i % _queries.length]);
  }
}

int _measure(StockSearchIndex index) {
  final sw = Stopwatch()..start();
  var sink = 0;
  for (var i = 0; i < _n; i++) {
    // 결과를 쓰지 않으면 컴파일러가 호출을 통째로 지울 수 있음
    sink += index.search(_queries[i % _queries.length]).length;
  }
  sw.stop();
  expect(sink, greaterThan(0));
  return sw.elapsedMicroseconds;
}

void main() {
  final stocks = loadStocks();

  test('선형 vs 색인 속도 측정', () {
    final buildSw = Stopwatch()..start();
    final ngram = NgramIndex(stocks);
    buildSw.stop();
    final buildUs = buildSw.elapsedMicroseconds;

    final linear = LinearSearchIndex(stocks);

    _warmUp(linear);
    _warmUp(ngram);

    final linearUs = _measure(linear);
    final ngramUs = _measure(ngram);

    final s = ngram.stats;

    String per(int total) => (total / _n).toStringAsFixed(1);

    print('');
    print('종목 ${stocks.length}건 · 질의 ${_queries.length}종 · $_n회 반복');
    print('---------------------------------------------');
    print('색인 구축   ${(buildUs / 1000).toStringAsFixed(1)}ms');
    print(
      '포스팅      ${s.postings} / 고유 ${s.uniqueGrams} '
      '/ 평균 ${(s.postings / s.uniqueGrams).toStringAsFixed(2)} '
      '/ 최대 ${s.maxPosting}(${s.maxGram})',
    );
    print('---------------------------------------------');
    print(
      '선형        ${(linearUs / 1000).toStringAsFixed(0)}ms  '
      '(${per(linearUs)}μs/회)',
    );
    print(
      '색인        ${(ngramUs / 1000).toStringAsFixed(0)}ms  '
      '(${per(ngramUs)}μs/회)',
    );
    print('배율        ${(linearUs / ngramUs).toStringAsFixed(1)}배');
    print('');
  });

  test('질의별 측정', () {
    final ngram = NgramIndex(stocks);
    final linear = LinearSearchIndex(stocks);
    _warmUp(linear);
    _warmUp(ngram);

    print('');
    print('질의        결과   선형(μs)  색인(μs)');
    print('---------------------------------------------');
    for (final q in _queries) {
      final hits = ngram.search(q).length;

      final lsw = Stopwatch()..start();
      for (var i = 0; i < _n; i++) {
        linear.search(q);
      }
      lsw.stop();

      final nsw = Stopwatch()..start();
      for (var i = 0; i < _n; i++) {
        ngram.search(q);
      }
      nsw.stop();

      print(
        '${q.padRight(10)}  ${hits.toString().padLeft(4)}   '
        '${(lsw.elapsedMicroseconds / _n).toStringAsFixed(1).padLeft(7)}   '
        '${(nsw.elapsedMicroseconds / _n).toStringAsFixed(1).padLeft(7)}',
      );
    }
    print('');
  });
}
