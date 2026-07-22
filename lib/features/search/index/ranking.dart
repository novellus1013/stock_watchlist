import 'package:stock_watchlist/features/market/model/quote.dart';
import 'package:stock_watchlist/features/market/model/stock.dart';

import 'normalize.dart';

/// 완전일치 0 · 접두사 1 · 부분일치 2.
int scoreOf(Stock s, String normalizedQuery) {
  if (s.code == normalizedQuery) return 0;

  final name = normalize(s.name);
  if (name == normalizedQuery) return 0;
  if (name.startsWith(normalizedQuery)) return 1;
  if (s.code.startsWith(normalizedQuery)) return 1;
  return 2;
}

/// 동점이면 시가총액 내림차순.
List<Stock> rank(List<Stock> hits, String rawQuery, Map<String, Quote> quotes) {
  final q = normalize(rawQuery);

  // 점수를 한 번만 계산
  final scored = [
    for (final s in hits)
      (
        stock: s,
        score: q.isEmpty ? 0 : scoreOf(s, q),
        cap: quotes[s.code]?.marketCap ?? 0,
      ),
  ];

  scored.sort((a, b) {
    final byScore = a.score.compareTo(b.score);
    if (byScore != 0) return byScore;
    return b.cap.compareTo(a.cap);
  });

  return [for (final e in scored) e.stock];
}
