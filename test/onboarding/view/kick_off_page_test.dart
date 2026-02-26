import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget({required Widget child}) {
    return MaterialApp(
      theme: AppThemes.light.themeData.themeData,
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

    testWidgets('renders "You can trust us" badge text', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      expect(find.text('You can trust us'), findsOneWidget);
    });

    testWidgets('renders "Nothing is hardcoded!" badge text', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      expect(find.text('Nothing is hardcoded!'), findsOneWidget);
    });

    testWidgets('renders title text', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      expect(find.text("Let's kick things off!"), findsOneWidget);
    });

    testWidgets('renders description text', (tester) async {
      await tester.pumpWidget(buildTestableWidget(child: const KickOffPage()));

      expect(
        find.textContaining('For this demo'),
        findsOneWidget,
      );
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
