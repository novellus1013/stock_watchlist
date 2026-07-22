import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_watchlist/features/detail/model/quote_state.dart';
import 'package:stock_watchlist/features/market/provider/market_providers.dart';
import 'package:stock_watchlist/features/market/repo/market_repository_impl.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailViewModel extends _$DetailViewModel {
  DateTime? _selected;

  @override
  Future<QuoteState> build(String code) async {
    final cal = await ref.watch(calendarProvider.future);
    final date = _selected ?? MarketRepositoryImpl.parse(cal.latest);
    return _resolve(code, MarketRepositoryImpl.fmt(date));
  }

  //날짜에 넘길 초기값
  DateTime dateOr(DateTime fallback) => _selected ?? fallback;

  void changeDate(DateTime d) {
    final next = DateTime(d.year, d.month, d.day); // 시분초를 버려야 같은 날 비교 가능
    if (next == _selected) return;

    _selected = next;
    ref.invalidateSelf();
  }

  Future<QuoteState> _resolve(String code, String date) async {
    final quote = await ref
        .read(marketRepositoryProvider)
        .fetchQuote(code, date);
    if (quote != null) return QuoteState.available(quote);

    return const QuoteState.unavailable(UnavailableReason.unknown);
  }
}
