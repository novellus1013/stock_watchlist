import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_watchlist/core/api_exception.dart';
import 'package:stock_watchlist/core/env.dart';
import 'package:stock_watchlist/features/market/model/stock.dart';
import 'package:stock_watchlist/features/market/provider/market_providers.dart';
import 'package:stock_watchlist/features/search/view/stock_tile.dart';
import 'package:stock_watchlist/features/search/vm/search_view_model.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!Env.isConfigured) return const _NotConfigured();

    final snapState = ref.watch(snapshotProvider);
    final snap = snapState.value;

    if (snap == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('종목 검색')),
        body: snapState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : _SnapshotError(error: snapState.error),
      );
    }

    final q = ref.watch(searchViewModelProvider);
    final vm = ref.read(searchViewModelProvider.notifier);
    final results = ref.watch(searchResultsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('${snap.date} · ${snap.stocks.length}종목')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: '종목명 또는 종목코드',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              textInputAction: TextInputAction.search,
              onChanged: vm.setText,
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _MarketChip(market: null, label: '전체', selected: q.market),
                for (final m in Market.values)
                  _MarketChip(market: m, label: m.label, selected: q.market),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: switch (results) {
              AsyncValue(:final value?) when value.isEmpty => const Center(
                child: Text('검색 결과가 없습니다.'),
              ),
              AsyncValue(:final value?) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (_, i) => StockTile(
                  stock: value[i],
                  quote: snap.quotes[value[i].code],
                ),
              ),
              AsyncValue(hasError: true) => const Center(
                child: Text('검색에 실패했습니다.'),
              ),
              _ => const Center(child: CircularProgressIndicator()),
            },
          ),
        ],
      ),
    );
  }
}

class _MarketChip extends ConsumerWidget {
  const _MarketChip({
    required this.market,
    required this.label,
    required this.selected,
  });

  final Market? market;
  final String label;
  final Market? selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
    padding: const EdgeInsets.only(right: 8),
    child: ChoiceChip(
      label: Text(label),
      selected: selected == market,
      onSelected: (_) =>
          ref.read(searchViewModelProvider.notifier).setMarket(market),
    ),
  );
}

class _NotConfigured extends StatelessWidget {
  const _NotConfigured();

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'API 키가 설정되지 않았습니다.\nREADME의 실행 방법을 참고하세요.',
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

class _SnapshotError extends ConsumerWidget {
  const _SnapshotError({required this.error});

  final Object? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final e = error;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(e is StockApiException ? e.userMessage : '데이터를 불러오지 못했습니다.'),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => ref.invalidate(snapshotProvider),
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }
}
