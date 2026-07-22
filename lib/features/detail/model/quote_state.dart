import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';

part 'quote_state.freezed.dart';

@freezed
sealed class QuoteState with _$QuoteState {
  const factory QuoteState.available(Quote quote) = QuoteAvailable;

  const factory QuoteState.unavailable(
    UnavailableReason reason, {
    String? latestTradingDay,
  }) = QuoteUnavailable;
}

enum UnavailableReason {
  nonTradingDay('해당 일자는 거래일이 아닙니다'),
  beforeListing('상장 이전 기간입니다'),
  delisted('상장폐지 또는 거래정지'),
  unverifiable('거래일 여부를 확인할 수 없습니다'),
  unknown('해당 일자 데이터 없음');

  const UnavailableReason(this.label);

  final String label;
}
