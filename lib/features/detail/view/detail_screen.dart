import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:stock_watchlist/core/api_exception.dart';
import 'package:stock_watchlist/features/detail/model/quote_state.dart';
import 'package:stock_watchlist/features/detail/view/quote_label.dart';
import 'package:stock_watchlist/features/detail/vm/detail_view_model.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';
import 'package:stock_watchlist/features/market/provider/market_providers.dart';
import 'package:stock_watchlist/features/market/repo/market_repository_impl.dart';

final _dateFormat = DateFormat('yyyy-MM-dd');

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.code, required this.name});

  final String code;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(code));
    final value = state.value;

    // 날짜 피커의 상한. 아직 날짜를 안 골랐을 때 보여줄 날짜
    final latest = ref.watch(calendarProvider).value?.latest;
    final fallback = latest == null
        ? DateTime.now()
        : MarketRepositoryImpl.parse(latest);
    final shown = ref.watch(selectedDateProvider(code)) ?? fallback;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(16),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(code, style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
      ),
      body: Column(
        children: [
          // 날짜 바
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(_dateFormat.format(shown)),
                const Spacer(),
                TextButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: shown,
                      firstDate: DateTime(2020),
                      lastDate: fallback,
                    );
                    if (picked != null) {
                      ref
                          .read(selectedDateProvider(code).notifier)
                          .change(picked);
                    }
                  },
                  child: const Text('날짜 변경'),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 2,
            child: state.isLoading ? const LinearProgressIndicator() : null,
          ),

          // 이전 값이 남은 채 재조회가 실패하면 에러 화면이 안 뜸
          if (state.hasError && value != null)
            Container(
              width: double.infinity,
              color: Colors.orange.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber, size: 16),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      '새 날짜를 불러오지 못했습니다. 이전 조회 결과입니다.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        ref.invalidate(detailViewModelProvider(code)),
                    child: const Text('다시 시도'),
                  ),
                ],
              ),
            ),

          Expanded(
            child: switch ((value, state.isLoading)) {
              (null, true) => const Center(child: CircularProgressIndicator()),
              (null, false) => _Error(
                error: state.error,
                onRetry: () => ref.invalidate(detailViewModelProvider(code)),
              ),
              (final v?, _) => switch (v) {
                QuoteAvailable(:final quote) => _Body(quote: quote),
                QuoteUnavailable(:final reason, :final latestTradingDay) =>
                  _Unavailable(
                    reason: reason,
                    latestTradingDay: latestTradingDay,
                  ),
              },
            },
          ),
        ],
      ),
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
  const _Unavailable({required this.reason, this.latestTradingDay});

  final UnavailableReason reason;
  final String? latestTradingDay;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.event_busy, size: 48, color: Colors.grey),
          const SizedBox(height: 12),
          Text(reason.label, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            _hint(),
            style: const TextStyle(fontSize: 13, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );

  String _hint() => switch (reason) {
    UnavailableReason.nonTradingDay =>
      latestTradingDay == null
          ? '다른 날짜를 선택해 보세요.'
          : '최근 거래일은 ${_pretty(latestTradingDay!)}입니다.',
    UnavailableReason.beforeListing => '상장일 이후 날짜를 선택해 보세요.',
    UnavailableReason.delisted => '최근 거래일에 이 종목의 시세가 없습니다.',
    UnavailableReason.unverifiable =>
      '조회 가능한 기간을 벗어났습니다.\n최근 3개월 내 날짜를 선택해 보세요.',
    UnavailableReason.unknown => '다른 날짜를 선택해 보세요.',
  };

  String _pretty(String yyyymmdd) =>
      '${yyyymmdd.substring(0, 4)}-'
      '${yyyymmdd.substring(4, 6)}-'
      '${yyyymmdd.substring(6)}';
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
