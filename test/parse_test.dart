import 'package:flutter_test/flutter_test.dart';
import 'package:stock_watchlist/core/parse.dart';

void main() {
  test('실제 응답 형태를 파싱한다.', () {
    expect(parseNum('1221'), 1221);
    expect(parseNum('-29'), -29);
    expect(parseNum('.25'), 0.25); // 선행 0 생략
    expect(parseNum('-.28'), -0.28); // 선행 0 생략 + 음수
    expect(parseNum('0'), 0);
    expect(parseNum(''), isNull);
    expect(parseNum(null), isNull);
  });
}
