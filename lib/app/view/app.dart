import 'package:flutter/material.dart';
import 'package:vgv_genui_financial_advisor/design_system/design_system.dart';
import 'package:vgv_genui_financial_advisor/feature_flags/feature_flags.dart';
import 'package:vgv_genui_financial_advisor/l10n/l10n.dart';
import 'package:vgv_genui_financial_advisor/onboarding/intro/intro.dart';
import 'package:vgv_genui_financial_advisor/onboarding/onboarding.dart';

class App extends StatelessWidget {
  const App({
    required this.navigatorObservers,
    this.showDevMenu = false,
    super.key,
  });

  final List<NavigatorObserver> navigatorObservers;
  final bool showDevMenu;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.light.themeData.getThemeData(context),
      darkTheme: AppThemes.dark.themeData.getThemeData(context),
      builder: (context, child) {
        return Theme(
          data: AppThemes.light.themeData.getThemeData(context),
          child: child ?? const SizedBox.shrink(),
        );
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: navigatorObservers,
      home: const _IntroPage(),
    );
  }
}

class _IntroPage extends StatelessWidget {
  const _IntroPage({this.showDevMenu = false});

  final bool showDevMenu;

  @override
  Widget build(BuildContext context) {
    return IntroPage(
      onGetStarted: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => _StartPage(showDevMenu: showDevMenu),
        ),
      ),
    );
  }
}

class _StartPage extends StatelessWidget {
  const _StartPage({this.showDevMenu = false});

  final bool showDevMenu;

  @override
  Widget build(BuildContext context) {
    if (!showDevMenu) {
      return const Scaffold(body: KickOffPage());
    }

    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeAppBarTitle),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.bug_report),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              );
            },
          ),
        ],
      ),
      endDrawer: const DevMenuDrawer(),
      body: const KickOffPage(),
    );
  }
}
