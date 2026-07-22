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

@freezed
sealed class QuoteState with _$QuoteState {
  // union은 sealed
  const factory QuoteState.available(Quote quote) = QuoteAvailable;
  const factory QuoteState.unavailable(
    UnavailableReason reason, {
    String? nearestTradingDay,
  }) = QuoteUnavailable;
}

enum UnavailableReason {
  nonTradingDay('해당 일자는 거래일이 아닙니다'),
  beforeListing('상장 이전 기간입니다'),
  delisted('상장폐지 또는 거래정지'),
  unknown('해당 일자 데이터 없음');

  const UnavailableReason(this.label);
  final String label;
}
