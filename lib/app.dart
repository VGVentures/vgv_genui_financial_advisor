import 'package:finance_app/design_system/design_system.dart';
import 'package:finance_app/l10n/l10n.dart';
import 'package:finance_app/onboarding/intro/intro.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return Theme(
          data: AppThemes.light.themeData.getThemeData(context),
          child: child ?? const SizedBox.shrink(),
        );
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const _IntroPage(),
    );
  }
}

class _IntroPage extends StatelessWidget {
  const _IntroPage();

  @override
  Widget build(BuildContext context) {
    return const IntroPage();
  }
}
