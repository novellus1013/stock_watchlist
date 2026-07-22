// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchlistEntry _$WatchlistEntryFromJson(Map<String, dynamic> json) =>
    _WatchlistEntry(
      code: json['code'] as String,
      name: json['name'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
    );

Map<String, dynamic> _$WatchlistEntryToJson(_WatchlistEntry instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'addedAt': instance.addedAt.toIso8601String(),
    };
