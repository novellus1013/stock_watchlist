import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_watchlist/features/watchlist/model/watchlist_entry.dart';

import 'watchlist_repository.dart';

part 'watchlist_repository_impl.g.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  static const _key = 'watchlist';

  @override
  Future<List<WatchlistEntry>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return const [];

    try {
      final list = jsonDecode(raw) as List;
      return [
        for (final e in list)
          WatchlistEntry.fromJson(e as Map<String, dynamic>),
      ];
    } on FormatException {
      // 저장 형식이 바뀌었거나 값이 깨진 경우.
      await prefs.remove(_key);
      return const [];
    }
  }

  @override
  Future<void> save(List<WatchlistEntry> entries) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode([for (final e in entries) e.toJson()]),
    );
  }
}

@Riverpod(keepAlive: true)
WatchlistRepository watchlistRepository(Ref ref) => WatchlistRepositoryImpl();
