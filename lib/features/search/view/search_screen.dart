import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_watchlist/core/api_exception.dart';
import 'package:stock_watchlist/core/env.dart';
import 'package:stock_watchlist/features/market/provider/market_providers.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!Env.isConfigured) {
      return const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text('API 키가 설정되지 않았습니다.', textAlign: TextAlign.center),
          ),
        ),
      );
    }

    final state = ref.watch(snapshotProvider);
    final snap = state.value;

    if (snap == null && state.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (snap == null) {
      final e = state.error;
      return Scaffold(
        body: Center(
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
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('${snap.date} · ${snap.stocks.length}종목')),
      body: ListView.builder(
        itemCount: snap.stocks.length,
        itemBuilder: (_, i) {
          final s = snap.stocks[i];
          final q = snap.quotes[s.code]!;
          return ListTile(
            dense: true,
            title: Text(s.name),
            subtitle: Text('${s.code} · ${s.market?.label ?? '-'}'),
            trailing: Text('${q.close}  ${q.changeRate}%'),
          );
        },
      ),
    );
  }
}
