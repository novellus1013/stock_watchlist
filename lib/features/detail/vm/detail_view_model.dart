import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_watchlist/features/detail/model/quote_state.dart';
import 'package:stock_watchlist/features/market/provider/market_providers.dart';
import 'package:stock_watchlist/features/market/repo/market_repository_impl.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailViewModel extends _$DetailViewModel {
  @override
  Future<QuoteState> build(String code) async {
    final cal = await ref.watch(calendarProvider.future);
    return _resolve(code, cal.latest);
  }

  Future<QuoteState> _resolve(String code, String date) async {
    final quote = await ref
        .read(marketRepositoryProvider)
        .fetchQuote(code, date);
    if (quote != null) return QuoteState.available(quote);

    return const QuoteState.unavailable(UnavailableReason.unknown);
  }
}
