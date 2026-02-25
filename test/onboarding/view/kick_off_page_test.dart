import 'package:finance_app/onboarding/onboarding.dart';
import 'package:finance_app/persona/persona.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNavigatorObserver extends Mock implements NavigatorObserver {}

class _FakeRoute extends Fake implements Route<dynamic> {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeRoute());
  });

  group(KickOffPage, () {
    testWidgets('renders badges with correct text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: KickOffPage()),
      );

      expect(find.text('You can trust us'), findsOneWidget);
      expect(find.text('Nothing is hardcoded!'), findsOneWidget);
    });

    testWidgets('renders title text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: KickOffPage()),
      );

      expect(find.text("Let's kick\nthings off!"), findsOneWidget);
    });

    testWidgets('renders description text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: KickOffPage()),
      );

      expect(
        find.text(
          'Welcome to your personal finance companion. '
          "We're here to help you make smarter financial decisions.",
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders next button with arrow icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: KickOffPage()),
      );

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('tapping next button navigates to PersonaSelectorPage', (
      tester,
    ) async {
      final observer = _MockNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: const KickOffPage(),
          navigatorObservers: [observer],
        ),
      );

      reset(observer);

      await tester.tap(find.byIcon(Icons.arrow_forward));
      await tester.pumpAndSettle();

      verify(
        () => observer.didReplace(
          newRoute: any(named: 'newRoute'),
          oldRoute: any(named: 'oldRoute'),
        ),
      ).called(1);
      expect(find.byType(PersonaSelectorPage), findsOneWidget);
    });

    testWidgets('renders TrustBadge widgets', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: KickOffPage()),
      );

      expect(find.byType(TrustBadge), findsNWidgets(2));
    });

    testWidgets('renders verified icon on first badge', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: KickOffPage()),
      );

      expect(find.byIcon(Icons.verified), findsOneWidget);
    });
  });
}
