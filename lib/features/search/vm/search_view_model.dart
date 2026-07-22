import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_watchlist/features/market/model/stock.dart';
import 'package:stock_watchlist/features/market/provider/market_providers.dart';
import 'package:stock_watchlist/features/search/index/linear_index.dart';
import 'package:stock_watchlist/features/search/index/ranking.dart';
import 'package:stock_watchlist/features/search/index/search_index.dart';

part 'search_view_model.g.dart';

/// 검색어와 시장 필터. record라 값이 같으면 리빌드 x
typedef SearchQuery = ({String text, Market? market});

@riverpod
class SearchViewModel extends _$SearchViewModel {
  @override
  SearchQuery build() => (text: '', market: null);

  void setText(String v) => state = (text: v, market: state.market);

  void setMarket(Market? v) => state = (text: state.text, market: v);
}

/// 스냅샷이 바뀔 때만 다시 만든다. 검색어가 바뀌어도 재구축하지 않는다.
@Riverpod(keepAlive: true)
Future<StockSearchIndex> searchIndex(Ref ref) async {
  final snap = await ref.watch(snapshotProvider.future);
  return LinearSearchIndex(snap.stocks);
}

@riverpod
Future<List<Stock>> searchResults(Ref ref) async {
  final q = ref.watch(searchViewModelProvider);
  final index = await ref.watch(searchIndexProvider.future);
  final snap = await ref.watch(snapshotProvider.future);

  var hits = index.search(q.text);

  if (q.market != null) {
    hits = [
      for (final s in hits)
        if (s.market == q.market) s,
    ];
  }

  return rank(hits, q.text, snap.quotes);
}
