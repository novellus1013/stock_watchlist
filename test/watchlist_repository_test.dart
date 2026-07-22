import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_watchlist/features/watchlist/model/watchlist_entry.dart';
import 'package:stock_watchlist/features/watchlist/repo/watchlist_repository_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('저장한 뒤 다시 읽으면 같은 값이 나온다', () async {
    SharedPreferences.setMockInitialValues({});
    final repo = WatchlistRepositoryImpl();

    final entry = WatchlistEntry(
      code: '005930',
      name: '삼성전자',
      addedAt: DateTime(2026, 7, 21, 15, 30),
    );

    await repo.save([entry]);
    expect(await repo.load(), [entry]);
  });

  test('저장된 값이 없으면 빈 목록', () async {
    SharedPreferences.setMockInitialValues({});
    expect(await WatchlistRepositoryImpl().load(), isEmpty);
  });

  test('값이 깨져 있으면 비우고 빈 목록', () async {
    SharedPreferences.setMockInitialValues({'watchlist': '{망가진 값'});
    expect(await WatchlistRepositoryImpl().load(), isEmpty);
  });
}
