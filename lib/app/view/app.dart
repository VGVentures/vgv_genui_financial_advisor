import 'package:finance_app/core/analytics_repository/analytics_repository.dart';
import 'package:finance_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required this.analyticsRepository,
    super.key,
  });

  final AnalyticsRepository analyticsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: analyticsRepository,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [analyticsRepository.navigationObserver],
        home: const Scaffold(),
      ),
    );
  }
}
