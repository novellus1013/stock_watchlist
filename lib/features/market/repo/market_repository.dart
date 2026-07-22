import 'package:stock_watchlist/features/market/model/market_snapshot.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';
import 'package:stock_watchlist/features/market/model/trading_calendar.dart';

abstract interface class MarketRepository {
  Future<TradingCalendar> fetchCalendar();
  Future<MarketSnapshot> fetchSnapshot(String date);
  Future<Quote?> fetchQuote(String code, String date);
  Future<bool> hasDataInPastYear(String code, String date);
}
