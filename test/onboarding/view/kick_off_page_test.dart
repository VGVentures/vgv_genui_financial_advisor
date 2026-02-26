import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/l10n/l10n.dart';
import 'package:finance_app/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget({required Widget child}) {
    return MaterialApp(
      theme: AppThemes.light.themeData.themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    );
  }

  group(KickOffPage, () {
    testWidgets('renders without errors', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      expect(find.byType(KickOffPage), findsOneWidget);
    });

    testWidgets('renders two TrustBadge widgets', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      expect(find.byType(TrustBadge), findsNWidgets(2));
    });

    testWidgets('renders trust badge text', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      final context = tester.element(find.byType(KickOffPage));
      final l10n = AppLocalizations.of(context);

      expect(find.text(l10n.trustBadgeText), findsOneWidget);
    });

    testWidgets('renders not hardcoded badge text', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      final context = tester.element(find.byType(KickOffPage));
      final l10n = AppLocalizations.of(context);

      expect(find.text(l10n.notHardcodedBadgeText), findsOneWidget);
    });

    testWidgets('renders title text', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      final context = tester.element(find.byType(KickOffPage));
      final l10n = AppLocalizations.of(context);

      expect(find.text(l10n.kickOffTitle), findsOneWidget);
    });

    testWidgets('renders description text', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      final context = tester.element(find.byType(KickOffPage));
      final l10n = AppLocalizations.of(context);

      expect(find.text(l10n.kickOffDescription), findsOneWidget);
    });

    testWidgets('renders next button with arrow icon', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('next button is tappable', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      final button = find.byType(OutlinedButton);
      expect(button, findsOneWidget);

      // Should not throw when tapped
      await tester.tap(button);
      await tester.pump();
    });

    testWidgets('renders ResponsiveScaffold', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      expect(find.byType(ResponsiveScaffold), findsOneWidget);
    });

    testWidgets('renders Scaffold with correct background color', (
      tester,
    ) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold).first);
      final appColors = LightThemeColors();

      expect(scaffold.backgroundColor, equals(appColors.accentBlue));
    });
  });
}
