import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_watchlist/features/market/model/quote.dart';

final priceFormat = NumberFormat('#,###');

/// 목록과 상세 같이. Quote만 알아서 market에
class QuoteLabel extends StatelessWidget {
  const QuoteLabel({super.key, required this.quote});

  final Quote quote;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text('${priceFormat.format(quote.close)}원'),
      // 원본이 ".25" 형태라 그대로 쓰면 ".25%"
      Text(
        '${quote.changeRate.toStringAsFixed(2)}%',
        style: TextStyle(fontSize: 12, color: quoteColor(quote)),
      ),
    ],
  );
}

Color quoteColor(Quote q) => q.isUp
    ? Colors.red
    : q.isDown
    ? Colors.blue
    : Colors.grey;
