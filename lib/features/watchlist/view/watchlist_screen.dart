import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_watchlist/features/market/model/market_snapshot.dart';
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

    final sorted = [...entries]..sort((a, b) => b.addedAt.compareTo(a.addedAt));

    return Scaffold(
      appBar: AppBar(title: Text('관심종목 ${sorted.length}')),
      body: sorted.isEmpty
          ? const Center(child: Text('검색 화면에서 별을 눌러 추가해 보세요.'))
          : ListView.builder(
              itemCount: sorted.length,
              itemBuilder: (_, i) =>
                  _WatchlistTile(entry: sorted[i], snapshot: snap),
            ),
    );
  }
}

class _WatchlistTile extends ConsumerWidget {
  const _WatchlistTile({required this.entry, this.snapshot});

  final WatchlistEntry entry;

  /// null이면 아직 못 받았다는 뜻. 폐지로 단정하지 않는다
  final MarketSnapshot? snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snap = snapshot;
    final delisted = snap != null && !snap.isListed(entry.code);

    // 스냅샷에 있으면 그 이름이 우선, 없으면 담을 때 저장해둔 이름
    final name =
        snap?.stocks
            .where((s) => s.code == entry.code)
            .map((s) => s.name)
            .firstOrNull ??
        entry.name;

    final quote = snap?.quotes[entry.code];

    return ListTile(
      dense: true,
      title: Text(
        name,
        style: delisted ? const TextStyle(color: Colors.grey) : null,
      ),
      subtitle: Text(
        delisted ? '${entry.code} · 상장폐지 또는 거래정지' : entry.code,
        style: delisted ? const TextStyle(color: Colors.grey) : null,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (quote != null) _QuoteText(quote: quote),
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

class _QuoteText extends StatelessWidget {
  const _QuoteText({required this.quote});

  final Quote quote;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text('${quote.close}'),
      Text(
        '${quote.changeRate.toStringAsFixed(2)}%',
        style: TextStyle(
          fontSize: 12,
          color: quote.isUp
              ? Colors.red
              : quote.isDown
              ? Colors.blue
              : Colors.grey,
        ),
      ),
    ],
  );
}
