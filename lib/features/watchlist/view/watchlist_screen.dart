import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';
import 'package:stock_watchlist/features/market/provider/market_providers.dart';
import 'package:stock_watchlist/features/watchlist/model/watchlist_entry.dart';
import 'package:stock_watchlist/features/watchlist/vm/watchlist_view_model.dart';

class WatchlistScreen extends ConsumerWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries =
        ref.watch(watchlistViewModelProvider).value ?? const <WatchlistEntry>[];
    final snap = ref.watch(snapshotProvider).value;

    // 최근에 담은 것부터
    final sorted = [...entries]..sort((a, b) => b.addedAt.compareTo(a.addedAt));

    return Scaffold(
      appBar: AppBar(title: Text('관심종목 ${sorted.length}')),
      body: sorted.isEmpty
          ? const Center(child: Text('검색 화면에서 별을 눌러 추가해 보세요.'))
          : ListView.builder(
              itemCount: sorted.length,
              itemBuilder: (_, i) {
                final e = sorted[i];
                // stocks 이름이 우선, 없으면 저장해둔 이름
                final name =
                    snap?.stocks
                        .where((s) => s.code == e.code)
                        .map((s) => s.name)
                        .firstOrNull ??
                    e.name;

                return _WatchlistTile(
                  entry: e,
                  name: name,
                  quote: snap?.quotes[e.code],
                );
              },
            ),
    );
  }
}

class _WatchlistTile extends ConsumerWidget {
  const _WatchlistTile({required this.entry, required this.name, this.quote});

  final WatchlistEntry entry;
  final String name;
  final Quote? quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final q = quote;

    return ListTile(
      dense: true,
      title: Text(name),
      subtitle: Text(entry.code),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (q != null)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${q.close}'),
                Text(
                  '${q.changeRate.toStringAsFixed(2)}%',
                  style: TextStyle(
                    fontSize: 12,
                    color: q.isUp
                        ? Colors.red
                        : q.isDown
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            tooltip: '관심종목에서 삭제',
            onPressed: () => ref
                .read(watchlistViewModelProvider.notifier)
                .remove(entry.code),
          ),
        ],
      ),
    );
  }
}
