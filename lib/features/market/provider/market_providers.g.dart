// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(calendar)
const calendarProvider = CalendarProvider._();

final class CalendarProvider
    extends
        $FunctionalProvider<
          AsyncValue<TradingCalendar>,
          TradingCalendar,
          FutureOr<TradingCalendar>
        >
    with $FutureModifier<TradingCalendar>, $FutureProvider<TradingCalendar> {
  const CalendarProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarHash();

  @$internal
  @override
  $FutureProviderElement<TradingCalendar> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TradingCalendar> create(Ref ref) {
    return calendar(ref);
  }
}

String _$calendarHash() => r'420f5fef2d4d442ed4624e43fc9098bb16472005';

@ProviderFor(snapshot)
const snapshotProvider = SnapshotProvider._();

final class SnapshotProvider
    extends
        $FunctionalProvider<
          AsyncValue<MarketSnapshot>,
          MarketSnapshot,
          FutureOr<MarketSnapshot>
        >
    with $FutureModifier<MarketSnapshot>, $FutureProvider<MarketSnapshot> {
  const SnapshotProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'snapshotProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$snapshotHash();

  @$internal
  @override
  $FutureProviderElement<MarketSnapshot> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MarketSnapshot> create(Ref ref) {
    return snapshot(ref);
  }
}

String _$snapshotHash() => r'2af221794c61a039718cf0abfd3724c673af7889';
