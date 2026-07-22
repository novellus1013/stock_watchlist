import 'package:stock_watchlist/core/api_exception.dart';
import 'package:stock_watchlist/core/dio_provider.dart';
import 'package:stock_watchlist/core/stock_service.dart';
import 'package:stock_watchlist/features/market/model/market_snapshot.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';
import 'package:stock_watchlist/features/market/model/stock.dart';
import 'package:stock_watchlist/features/market/model/trading_calendar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_watchlist/features/market/repo/market_repository.dart';

part 'market_repository_impl.g.dart';

@Riverpod(keepAlive: true)
MarketRepository marketRepository(Ref ref) =>
    MarketRepositoryImpl(StockService(ref.watch(dioProvider)));

class MarketRepositoryImpl implements MarketRepository {
  MarketRepositoryImpl(this._service);
  final StockService _service;

  static String fmt(DateTime d) =>
      '${d.year}'
      '${d.month.toString().padLeft(2, '0')}'
      '${d.day.toString().padLeft(2, '0')}';

  static DateTime parse(String yyyymmdd) => DateTime(
    int.parse(yyyymmdd.substring(0, 4)),
    int.parse(yyyymmdd.substring(4, 6)),
    int.parse(yyyymmdd.substring(6, 8)),
  );

  @override
  Future<TradingCalendar> fetchCalendar() async {
    final now = DateTime.now();
    final from = now.subtract(const Duration(days: 90));
    final rows = await _service.getStockPrices(
      likeSrtnCd: '005930',
      beginBasDt: fmt(from),
      endBasDt: fmt(now.add(const Duration(days: 1))), // 미만이라 +1일
      numOfRows: 200,
    );
    if (rows.isEmpty) {
      throw const StockApiException('거래일을 확인할 수 없습니다');
    }
    return TradingCalendar(
      rows.map((r) => r['basDt'] as String).toSet(),
      from: fmt(from),
      to: fmt(now),
    );
  }

  @override
  Future<MarketSnapshot> fetchSnapshot(String date) async {
    final rows = await _service.getStockPrices(basDt: date);
    return MarketSnapshot(
      date: date,
      stocks: rows.map(Stock.fromRow).toList(),
      quotes: {for (final r in rows) r['srtnCd'] as String: Quote.fromRow(r)},
    );
  }

  @override
  Future<Quote?> fetchQuote(String code, String date) async {
    // likeSrtnCd는 정확히 일치하는 행만
    final rows = await _service.getStockPrices(
      basDt: date,
      likeSrtnCd: code,
      numOfRows: 20,
    );
    for (final r in rows) {
      if (r['srtnCd'] == code) return Quote.fromRow(r);
    }
    return null;
  }

  @override
  Future<bool> hasDataInPastYear(String code, String date) async {
    final end = parse(date);
    final rows = await _service.getStockPrices(
      likeSrtnCd: code,
      beginBasDt: fmt(DateTime(end.year - 1, end.month, end.day)),
      endBasDt: date, // 미만
      numOfRows: 20,
    );
    return rows.any((r) => r['srtnCd'] == code);
  }
}
