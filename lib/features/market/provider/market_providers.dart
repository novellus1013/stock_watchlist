import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_watchlist/features/market/model/market_snapshot.dart';
import 'package:stock_watchlist/features/market/model/trading_calendar.dart';
import 'package:stock_watchlist/features/market/repo/market_repository_impl.dart';

part 'market_providers.g.dart';

@Riverpod(keepAlive: true)
Future<TradingCalendar> calendar(Ref ref) =>
    ref.watch(marketRepositoryProvider).fetchCalendar();

@Riverpod(keepAlive: true)
Future<MarketSnapshot> snapshot(Ref ref) async {
  final cal = await ref.watch(calendarProvider.future);
  return ref.watch(marketRepositoryProvider).fetchSnapshot(cal.latest);
}
