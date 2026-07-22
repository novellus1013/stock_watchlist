import 'package:stock_watchlist/features/market/model/stock.dart';

abstract interface class StockSearchIndex {
  List<Stock> search(String query);
}
