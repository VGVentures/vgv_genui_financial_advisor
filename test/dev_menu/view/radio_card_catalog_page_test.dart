import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/dev_menu/dev_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _pumpPage(WidgetTester tester) {
  return tester.pumpWidget(
    const MaterialApp(home: RadioCardCatalogPage()),
  );
}

void main() {
  group('RadioCardCatalogPage', () {
    testWidgets('renders RadioCard app bar title', (tester) async {
      await _pumpPage(tester);

      expect(find.text('RadioCard'), findsOneWidget);
    });

    testWidgets('renders selected state section', (tester) async {
      await _pumpPage(tester);

      expect(find.text('Selected state'), findsOneWidget);
      expect(find.text('Option A'), findsOneWidget);
    });

    testWidgets('renders unselected state section', (tester) async {
      await _pumpPage(tester);

      expect(find.text('Unselected state'), findsOneWidget);
      expect(find.text('Option B'), findsOneWidget);
    });

    testWidgets('renders interactive group section', (tester) async {
      await _pumpPage(tester);

      expect(find.text('Interactive group'), findsOneWidget);
      expect(find.text('Monthly'), findsOneWidget);
      expect(find.text('Yearly'), findsOneWidget);
    });

    testWidgets('tapping Yearly card updates selection', (tester) async {
      await _pumpPage(tester);

      await tester.tap(find.text('Yearly'));
      await tester.pump();

      final yearlyCard = tester.widget<RadioCard>(
        find.widgetWithText(RadioCard, 'Yearly'),
      );
      expect(yearlyCard.isSelected, isTrue);

      final monthlyCard = tester.widget<RadioCard>(
        find.widgetWithText(RadioCard, 'Monthly'),
      );
      expect(monthlyCard.isSelected, isFalse);
    });
  });
}
