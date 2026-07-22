// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedDate)
const selectedDateProvider = SelectedDateFamily._();

final class SelectedDateProvider
    extends $NotifierProvider<SelectedDate, DateTime?> {
  const SelectedDateProvider._({
    required SelectedDateFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'selectedDateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$selectedDateHash();

  @override
  String toString() {
    return r'selectedDateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SelectedDate create() => SelectedDate();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedDateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$selectedDateHash() => r'e3935a130d0b89dee148ec9dc20a7e1af680a619';

final class SelectedDateFamily extends $Family
    with
        $ClassFamilyOverride<
          SelectedDate,
          DateTime?,
          DateTime?,
          DateTime?,
          String
        > {
  const SelectedDateFamily._()
    : super(
        retry: null,
        name: r'selectedDateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SelectedDateProvider call(String code) =>
      SelectedDateProvider._(argument: code, from: this);

  @override
  String toString() => r'selectedDateProvider';
}

abstract class _$SelectedDate extends $Notifier<DateTime?> {
  late final _$args = ref.$arg as String;
  String get code => _$args;

  DateTime? build(String code);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<DateTime?, DateTime?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime?, DateTime?>,
              DateTime?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

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

String _$detailViewModelHash() => r'69886a6131aae9352724f27593fa7e6cf8cc1a64';

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
