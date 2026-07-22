import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_entry.freezed.dart';
part 'watchlist_entry.g.dart';

@freezed
abstract class WatchlistEntry with _$WatchlistEntry {
  const factory WatchlistEntry({
    required String code,

    // 표시 전용
    required String name,

    required DateTime addedAt,
  }) = _WatchlistEntry;

  factory WatchlistEntry.fromJson(Map<String, dynamic> json) =>
      _$WatchlistEntryFromJson(json);
}
