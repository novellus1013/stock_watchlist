// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchViewModel)
const searchViewModelProvider = SearchViewModelProvider._();

final class SearchViewModelProvider
    extends $NotifierProvider<SearchViewModel, SearchQuery> {
  const SearchViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchViewModelHash();

  @$internal
  @override
  SearchViewModel create() => SearchViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchQuery>(value),
    );
  }
}

String _$searchViewModelHash() => r'2f22dd236e90c9a8c28403a3570b08d6e7d407ea';

abstract class _$SearchViewModel extends $Notifier<SearchQuery> {
  SearchQuery build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SearchQuery, SearchQuery>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchQuery, SearchQuery>,
              SearchQuery,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 스냅샷이 바뀔 때만 다시 만든다. 검색어가 바뀌어도 재구축하지 않는다.

@ProviderFor(searchIndex)
const searchIndexProvider = SearchIndexProvider._();

/// 스냅샷이 바뀔 때만 다시 만든다. 검색어가 바뀌어도 재구축하지 않는다.

final class SearchIndexProvider
    extends
        $FunctionalProvider<
          AsyncValue<StockSearchIndex>,
          StockSearchIndex,
          FutureOr<StockSearchIndex>
        >
    with $FutureModifier<StockSearchIndex>, $FutureProvider<StockSearchIndex> {
  /// 스냅샷이 바뀔 때만 다시 만든다. 검색어가 바뀌어도 재구축하지 않는다.
  const SearchIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchIndexProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchIndexHash();

  @$internal
  @override
  $FutureProviderElement<StockSearchIndex> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StockSearchIndex> create(Ref ref) {
    return searchIndex(ref);
  }
}

String _$searchIndexHash() => r'55e59ace5d1bbf116ea52168b048b3dffd32993f';

@ProviderFor(searchResults)
const searchResultsProvider = SearchResultsProvider._();

final class SearchResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Stock>>,
          List<Stock>,
          FutureOr<List<Stock>>
        >
    with $FutureModifier<List<Stock>>, $FutureProvider<List<Stock>> {
  const SearchResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchResultsHash();

  @$internal
  @override
  $FutureProviderElement<List<Stock>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Stock>> create(Ref ref) {
    return searchResults(ref);
  }
}

String _$searchResultsHash() => r'ce66598f612131ec5e827f2401242bfc580204fb';
