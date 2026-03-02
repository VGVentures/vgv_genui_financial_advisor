import 'package:finance_app/app/presentation/filter_chip_palette.dart';
import 'package:finance_app/app/presentation/widgets/category_filter_chip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pump(
    WidgetTester tester, {
    FilterChipColor color = FilterChipColor.grey,
    bool? isSelected,
    bool isEnabled = true,
    VoidCallback? onTap,
    String label = 'Category 1',
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CategoryFilterChip(
            color: color,
            label: label,
            isSelected: isSelected,
            isEnabled: isEnabled,
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  BoxDecoration getDecoration(WidgetTester tester) {
    final container = tester.widget<Container>(
      find.descendant(
        of: find.byType(CategoryFilterChip),
        matching: find.byType(Container),
      ),
    );
    return container.decoration! as BoxDecoration;
  }

  Color? getTextColor(WidgetTester tester, String label) {
    return tester.widget<Text>(find.text(label)).style?.color;
  }

  group('CategoryFilterChip', () {
    testWidgets('renders label text', (tester) async {
      await pump(tester);
      expect(find.text('Category 1'), findsOneWidget);
    });

    group('default state (isSelected: null)', () {
      testWidgets('shows white background', (tester) async {
        await pump(tester);
        expect(getDecoration(tester).color, equals(Colors.white));
      });

      testWidgets('shows base color border', (tester) async {
        await pump(tester, color: FilterChipColor.pink);
        final base = FilterChipPalette.baseColors[FilterChipColor.pink]!;
        final border = getDecoration(tester).border! as Border;
        expect(border.top.color, equals(base));
      });

      testWidgets('shows dark text', (tester) async {
        await pump(tester);
        expect(
          getTextColor(tester, 'Category 1'),
          equals(const Color(0xFF5D5F5F)),
        );
      });
    });

    group('unselected state (isSelected: false)', () {
      testWidgets('shows 15% tint background', (tester) async {
        await pump(tester, color: FilterChipColor.pink, isSelected: false);
        final base = FilterChipPalette.baseColors[FilterChipColor.pink]!;
        expect(
          getDecoration(tester).color,
          equals(base.withValues(alpha: 0.15)),
        );
      });

      testWidgets('shows 1px solid color border', (tester) async {
        await pump(tester, color: FilterChipColor.pink, isSelected: false);
        final base = FilterChipPalette.baseColors[FilterChipColor.pink]!;
        final border = getDecoration(tester).border! as Border;
        expect(border.top.color, equals(base));
        expect(border.top.width, equals(1.0));
      });

      testWidgets('shows dark text', (tester) async {
        await pump(tester, color: FilterChipColor.pink, isSelected: false);
        expect(
          getTextColor(tester, 'Category 1'),
          equals(const Color(0xFF5D5F5F)),
        );
      });
    });

    group('selected state (isSelected: true)', () {
      testWidgets('shows solid base color background with no border', (
        tester,
      ) async {
        await pump(tester, color: FilterChipColor.pink, isSelected: true);
        final base = FilterChipPalette.baseColors[FilterChipColor.pink]!;
        final decoration = getDecoration(tester);
        expect(decoration.color, equals(base));
        expect(decoration.border, isNull);
      });

      testWidgets('shows white text for standard colors', (tester) async {
        await pump(tester, color: FilterChipColor.pink, isSelected: true);
        expect(getTextColor(tester, 'Category 1'), equals(Colors.white));
      });

      testWidgets('shows dark text for aqua variant', (tester) async {
        await pump(tester, color: FilterChipColor.aqua, isSelected: true);
        expect(
          getTextColor(tester, 'Category 1'),
          equals(const Color(0xFF5D5F5F)),
        );
      });

      testWidgets('shows dark text for lightOlive variant', (tester) async {
        await pump(tester, color: FilterChipColor.lightOlive, isSelected: true);
        expect(
          getTextColor(tester, 'Category 1'),
          equals(const Color(0xFF5D5F5F)),
        );
      });
    });

    group('disabled unselected state', () {
      testWidgets('shows grey background', (tester) async {
        await pump(tester, isSelected: false, isEnabled: false);
        expect(getDecoration(tester).color, equals(const Color(0xFFF0F1F1)));
      });

      testWidgets('shows grey border', (tester) async {
        await pump(tester, isSelected: false, isEnabled: false);
        final border = getDecoration(tester).border! as Border;
        expect(border.top.color, equals(const Color(0xFFE2E2E2)));
      });

      testWidgets('shows muted text', (tester) async {
        await pump(tester, isSelected: false, isEnabled: false);
        expect(
          getTextColor(tester, 'Category 1'),
          equals(const Color(0xFFAAABAB)),
        );
      });

      testWidgets('does not call onTap when tapped', (tester) async {
        var tapped = false;
        await pump(tester, isEnabled: false, onTap: () => tapped = true);
        await tester.tap(find.byType(CategoryFilterChip));
        expect(tapped, isFalse);
      });
    });

    group('disabled selected state', () {
      testWidgets('shows darker grey background with no border', (
        tester,
      ) async {
        await pump(tester, isSelected: true, isEnabled: false);
        final decoration = getDecoration(tester);
        expect(decoration.color, equals(const Color(0xFFC6C6C7)));
        expect(decoration.border, isNull);
      });

      testWidgets('shows muted text', (tester) async {
        await pump(tester, isSelected: true, isEnabled: false);
        expect(
          getTextColor(tester, 'Category 1'),
          equals(const Color(0xFFAAABAB)),
        );
      });
    });

    group('interaction', () {
      testWidgets('calls onTap when tapped and enabled', (tester) async {
        var tapped = false;
        await pump(tester, onTap: () => tapped = true);
        await tester.tap(find.byType(CategoryFilterChip));
        expect(tapped, isTrue);
      });

      testWidgets('shows 20% tint on hover', (tester) async {
        await pump(tester, color: FilterChipColor.pink, isSelected: false);
        final base = FilterChipPalette.baseColors[FilterChipColor.pink]!;

        final gesture = await tester.createGesture(
          kind: PointerDeviceKind.mouse,
        );
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();

        await gesture.moveTo(tester.getCenter(find.byType(CategoryFilterChip)));
        await tester.pump();

        expect(
          getDecoration(tester).color,
          equals(base.withValues(alpha: 0.20)),
        );
      });

      testWidgets('reverts to 15% tint when mouse exits', (tester) async {
        await pump(tester, color: FilterChipColor.pink, isSelected: false);
        final base = FilterChipPalette.baseColors[FilterChipColor.pink]!;

        final gesture = await tester.createGesture(
          kind: PointerDeviceKind.mouse,
        );
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();

        await gesture.moveTo(tester.getCenter(find.byType(CategoryFilterChip)));
        await tester.pump();
        await gesture.moveTo(const Offset(1000, 1000));
        await tester.pump();

        expect(
          getDecoration(tester).color,
          equals(base.withValues(alpha: 0.15)),
        );
      });
    });

    group('pill shape', () {
      testWidgets('has 32px border radius', (tester) async {
        await pump(tester);
        expect(
          getDecoration(tester).borderRadius,
          equals(BorderRadius.circular(32)),
        );
      });
    });

    group('color variants sampling', () {
      for (final color in [
        FilterChipColor.grey,
        FilterChipColor.mustard,
        FilterChipColor.deepRed,
        FilterChipColor.lightBlue,
        FilterChipColor.emerald,
      ]) {
        testWidgets('$color selected shows palette base color', (tester) async {
          await pump(tester, color: color, isSelected: true);
          expect(
            getDecoration(tester).color,
            equals(FilterChipPalette.baseColors[color]),
          );
        });
      }
    });
  });
}
