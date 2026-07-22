import 'package:flutter/material.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';
import 'package:stock_watchlist/features/market/model/stock.dart';

class StockTile extends StatelessWidget {
  const StockTile({super.key, required this.stock, this.quote});

  final Stock stock;
  final Quote? quote;

  @override
  Widget build(BuildContext context) {
    final q = quote;

    return ListTile(
      dense: true,
      title: Text(stock.name),
      subtitle: Text('${stock.code} · ${stock.market?.label ?? '-'}'),
      trailing: q == null
          ? null
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${q.close}'),
                // 원본이 ".25" 형태라 그대로 쓰면 ".25%"가 됨
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
    );
  }
}
