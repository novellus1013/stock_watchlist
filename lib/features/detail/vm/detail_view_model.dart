import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_watchlist/features/detail/model/quote_state.dart';
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

    return _resolve(code, MarketRepositoryImpl.fmt(date));
  }

  Future<QuoteState> _resolve(String code, String date) async {
    final quote = await ref
        .read(marketRepositoryProvider)
        .fetchQuote(code, date);
    if (quote != null) return QuoteState.available(quote);

    // 여기부터는 '요청은 성공했는데 그 날짜에 행이 없다'는 뜻
    final snap = await ref.read(snapshotProvider.future);
    if (!snap.isListed(code)) {
      return const QuoteState.unavailable(UnavailableReason.delisted);
    }

    return const QuoteState.unavailable(UnavailableReason.unknown);
  }
}
