import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_watchlist/core/api_exception.dart';
import 'package:stock_watchlist/features/detail/model/quote_state.dart';
import 'package:stock_watchlist/features/detail/view/quote_label.dart';
import 'package:stock_watchlist/features/detail/vm/detail_view_model.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.code, required this.name});

  final String code;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(code));
    final value = state.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Text(code, style: Theme.of(context).textTheme.bodySmall),
        ),
      ),
      body: switch ((value, state.isLoading)) {
        (null, true) => const Center(child: CircularProgressIndicator()),
        (null, false) => _Error(
          error: state.error,
          onRetry: () => ref.invalidate(detailViewModelProvider(code)),
        ),
        (final v?, _) => switch (v) {
          QuoteAvailable(:final quote) => _Body(quote: quote),
          QuoteUnavailable(:final reason) => _Unavailable(reason: reason),
        },
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.quote});

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    final q = quote;
    final sign = q.change > 0 ? '+' : '';

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          '${priceFormat.format(q.close)}원',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          '$sign${priceFormat.format(q.change)}  '
          '${q.changeRate.toStringAsFixed(2)}%',
          style: TextStyle(fontSize: 16, color: quoteColor(q)),
        ),
        const Divider(height: 32),
        _Row(label: '거래량', value: '${priceFormat.format(q.volume)}주'),
        _Row(label: '시가총액', value: '${priceFormat.format(q.marketCap)}원'),
        _Row(label: '기준일', value: q.date),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value),
      ],
    ),
  );
}

class _Unavailable extends StatelessWidget {
  const _Unavailable({required this.reason});

  final UnavailableReason reason;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.event_busy, size: 48, color: Colors.grey),
        const SizedBox(height: 12),
        Text(reason.label),
      ],
    ),
  );
}

class _Error extends StatelessWidget {
  const _Error({required this.error, required this.onRetry});

  final Object? error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final e = error;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(e is StockApiException ? e.userMessage : '시세를 불러오지 못했습니다.'),
          const SizedBox(height: 12),
          FilledButton(onPressed: onRetry, child: const Text('다시 시도')),
        ],
      ),
    );
  }
}
