import 'dart:convert';
import 'dart:io';

import 'package:stock_watchlist/features/market/model/stock.dart';

const kFullSnapshot = 'test/fixtures/stocks_full_20260721.json';

List<Map<String, dynamic>> loadRows([String path = kFullSnapshot]) {
  final raw = File(path).readAsStringSync();
  final items = jsonDecode(raw)['response']['body']['items']['item'] as List;
  return items.cast<Map<String, dynamic>>();
}

List<Stock> loadStocks([String path = kFullSnapshot]) =>
    loadRows(path).map(Stock.fromRow).toList();
