// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DetailViewModel)
const detailViewModelProvider = DetailViewModelFamily._();

final class DetailViewModelProvider
    extends $AsyncNotifierProvider<DetailViewModel, QuoteState> {
  const DetailViewModelProvider._({
    required DetailViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'detailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$detailViewModelHash();

  @override
  String toString() {
    return r'detailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DetailViewModel create() => DetailViewModel();

  @override
  bool operator ==(Object other) {
    return other is DetailViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$detailViewModelHash() => r'd47853dd28fa7c226c3aeca293a3cf9fcfecca15';

final class DetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          DetailViewModel,
          AsyncValue<QuoteState>,
          QuoteState,
          FutureOr<QuoteState>,
          String
        > {
  const DetailViewModelFamily._()
    : super(
        retry: null,
        name: r'detailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DetailViewModelProvider call(String code) =>
      DetailViewModelProvider._(argument: code, from: this);

  @override
  String toString() => r'detailViewModelProvider';
}

abstract class _$DetailViewModel extends $AsyncNotifier<QuoteState> {
  late final _$args = ref.$arg as String;
  String get code => _$args;

  FutureOr<QuoteState> build(String code);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<QuoteState>, QuoteState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<QuoteState>, QuoteState>,
              AsyncValue<QuoteState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
