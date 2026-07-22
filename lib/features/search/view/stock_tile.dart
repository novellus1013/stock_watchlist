import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_watchlist/features/detail/view/detail_screen.dart';
import 'package:stock_watchlist/features/detail/view/quote_label.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';
import 'package:stock_watchlist/features/market/model/stock.dart';
import 'package:stock_watchlist/features/watchlist/vm/watchlist_view_model.dart';

class StockTile extends ConsumerWidget {
  const StockTile({super.key, required this.stock, this.quote});

  final Stock stock;
  final Quote? quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // select로 이 종목의 별 상태만 구독. 목록 전체를 watch하면 다른 종목을 담을 때 화면의 모든 타일 리빌드
    final starred = ref.watch(
      watchlistViewModelProvider.select(
        (s) => (s.value ?? const []).any((e) => e.code == stock.code),
      ),
    );

    final q = quote;

    return ListTile(
      dense: true,
      title: Text(stock.name),
      subtitle: Text('${stock.code} · ${stock.market?.label ?? '-'}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (q != null) QuoteLabel(quote: q),
          IconButton(
            icon: Icon(starred ? Icons.star : Icons.star_border),
            color: starred ? Colors.amber : null,
            tooltip: starred ? '관심종목에서 삭제' : '관심종목에 추가',
            onPressed: () =>
                ref.read(watchlistViewModelProvider.notifier).toggle(stock),
          ),
        ],
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => DetailScreen(code: stock.code, name: stock.name),
        ),
      ),
    );
  }
}
