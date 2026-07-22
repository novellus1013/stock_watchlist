import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_watchlist/features/market/model/stock.dart';
import 'package:stock_watchlist/features/watchlist/model/watchlist_entry.dart';
import 'package:stock_watchlist/features/watchlist/repo/watchlist_repository_impl.dart';

part 'watchlist_view_model.g.dart';

@Riverpod(keepAlive: true)
class WatchlistViewModel extends _$WatchlistViewModel {
  @override
  Future<List<WatchlistEntry>> build() =>
      ref.watch(watchlistRepositoryProvider).load();

  Future<void> toggle(Stock stock) async {
    final current = state.value;
    if (current == null) return; // 아직 다 못 읽었으면 무시. 덮어쓰면 기존 목록이 날아감

    final next = [...current];
    final i = next.indexWhere((e) => e.code == stock.code);
    if (i >= 0) {
      next.removeAt(i);
    } else {
      next.add(
        WatchlistEntry(
          code: stock.code,
          name: stock.name,
          addedAt: DateTime.now(),
        ),
      );
    }
    await _commit(next);
  }

  /// 상장폐지 등으로 Stock이 없는 종목도 지울 수 있어야 한다
  Future<void> remove(String code) async {
    final current = state.value;
    if (current == null) return;

    await _commit([
      for (final e in current)
        if (e.code != code) e,
    ]);
  }

  Future<void> _commit(List<WatchlistEntry> next) async {
    state = AsyncData(next); // 화면 먼저 갱신
    await ref.read(watchlistRepositoryProvider).save(next); // 저장은 뒤에서
  }
}
