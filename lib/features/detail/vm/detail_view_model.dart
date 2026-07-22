import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_watchlist/features/detail/model/quote_state.dart';
import 'package:stock_watchlist/features/market/model/trading_calendar.dart';
import 'package:stock_watchlist/features/market/provider/market_providers.dart';
import 'package:stock_watchlist/features/market/repo/market_repository_impl.dart';

part 'detail_view_model.g.dart';

@riverpod
class SelectedDate extends _$SelectedDate {
  @override
  DateTime? build(String code) => null;

  void change(DateTime d) {
    // 시분초를 버려야 같은 날을 다시 골랐을 때 재조회하지 않는다
    state = DateTime(d.year, d.month, d.day);
  }
}

@riverpod
class DetailViewModel extends _$DetailViewModel {
  @override
  Future<QuoteState> build(String code) async {
    final cal = await ref.watch(calendarProvider.future);
    final selected = ref.watch(selectedDateProvider(code));
    final date = selected ?? MarketRepositoryImpl.parse(cal.latest);

    return _resolve(code, MarketRepositoryImpl.fmt(date), cal);
  }

  /// 사유는 날짜에 의존하는 것과 아닌 것으로 나뉜다.
  /// 날짜를 바꿔도 결론이 안 변하는 것부터 본다.
  Future<QuoteState> _resolve(
    String code,
    String date,
    TradingCalendar cal,
  ) async {
    final quote = await ref
        .read(marketRepositoryProvider)
        .fetchQuote(code, date);
    if (quote != null) return QuoteState.available(quote);

    // 여기부터는 '요청은 성공했는데 그 날짜에 행이 없다'는 뜻

    // ① 폐지 — 어떤 날짜를 골라도 결론이 같다
    final snap = await ref.read(snapshotProvider.future);
    if (!snap.isListed(code)) {
      return const QuoteState.unavailable(UnavailableReason.delisted);
    }

    // ② 휴장 — 달력에 있는데 그 날이 빠져 있다
    final trading = cal.isTradingDay(date);
    if (trading == false) {
      return QuoteState.unavailable(
        UnavailableReason.nonTradingDay,
        latestTradingDay: cal.latest,
      );
    }

    // ③ 달력 범위 밖 — 거래일인지조차 모른다. 휴장으로 단정하지 않는다
    if (trading == null) {
      return const QuoteState.unavailable(UnavailableReason.unverifiable);
    }

    // ④ 거래일이고 상장 중인데 행이 없다 (6-2에서 '상장 이전'을 갈라낸다)
    return const QuoteState.unavailable(UnavailableReason.unknown);
  }
}
