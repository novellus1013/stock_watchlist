import 'quote.dart';
import 'stock.dart';

class MarketSnapshot {
  const MarketSnapshot({
    required this.date,
    required this.stocks,
    required this.quotes,
  });

  final String date;
  final List<Stock> stocks;
  final Map<String, Quote> quotes; // 코드 → 시세

  /// 최신 스냅샷에 없으면 상장 폐지로 간주
  bool isListed(String code) => quotes.containsKey(code);
}
