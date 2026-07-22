import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_watchlist/features/search/view/search_screen.dart';
import 'core/api_exception.dart';

void main() {
  runApp(
    ProviderScope(
      retry: (retryCount, error) {
        if (error is StockApiException && !error.retryable) return null;
        if (retryCount >= 3) return null;
        return Duration(milliseconds: 300 * (1 << retryCount));
      },
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: '관심종목',
    theme: ThemeData(useMaterial3: true),
    home: const SearchScreen(),
  );
}
