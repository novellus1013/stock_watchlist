import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/parse.dart';
part 'quote.freezed.dart';

@freezed
abstract class Quote with _$Quote {
  const Quote._(); // 게터를 추가하려면 필요
  const factory Quote({
    required String date,
    required String code,
    required int close,
    required int change,
    required double changeRate,
    required int volume,
    required int marketCap,
  }) = _Quote;

  factory Quote.fromRow(Map<String, dynamic> r) => Quote(
    date: r['basDt'] as String,
    code: r['srtnCd'] as String,
    close: parseInt(r['clpr']),
    change: parseInt(r['vs']),
    changeRate: parseDouble(r['fltRt']),
    volume: parseInt(r['trqu']),
    marketCap: parseInt(r['mrktTotAmt']),
  );

  bool get isUp => change > 0;
  bool get isDown => change < 0;
}
