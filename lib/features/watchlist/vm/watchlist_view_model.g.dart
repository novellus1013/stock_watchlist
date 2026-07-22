// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WatchlistViewModel)
const watchlistViewModelProvider = WatchlistViewModelProvider._();

final class WatchlistViewModelProvider
    extends $AsyncNotifierProvider<WatchlistViewModel, List<WatchlistEntry>> {
  const WatchlistViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchlistViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchlistViewModelHash();

  @$internal
  @override
  WatchlistViewModel create() => WatchlistViewModel();
}

String _$watchlistViewModelHash() =>
    r'4179998b008a2c81cdb5372a76e5cfe20b92cfaa';

abstract class _$WatchlistViewModel
    extends $AsyncNotifier<List<WatchlistEntry>> {
  FutureOr<List<WatchlistEntry>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<WatchlistEntry>>, List<WatchlistEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<WatchlistEntry>>,
                List<WatchlistEntry>
              >,
              AsyncValue<List<WatchlistEntry>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
