import 'package:stock_watchlist/features/watchlist/model/watchlist_entry.dart';

abstract interface class WatchlistRepository {
  Future<List<WatchlistEntry>> load();
  Future<void> save(List<WatchlistEntry> entries);
}
