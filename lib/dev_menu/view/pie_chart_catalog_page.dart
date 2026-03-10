import 'package:finance_app/app/presentation.dart';
import 'package:flutter/material.dart';

/// {@template pie_chart_catalog_page}
/// A dev-menu page that showcases the [PieChartComponent] widget
/// with sample data.
/// {@endtemplate}
class PieChartCatalogPage extends StatelessWidget {
  /// {@macro pie_chart_catalog_page}

  const PieChartCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    final items = [
      PieChartItem(
        label: 'Groceries',
        value: 1420,
        amount: r'$1,420',
        color: colors?.pinkColor ?? const Color(0xFFE98AD4),
      ),
      PieChartItem(
        label: 'Shopping',
        value: 1420,
        amount: r'$1,420',
        color: colors?.mustardColor ?? const Color(0xFFF2C01C),
      ),
      PieChartItem(
        label: 'Dining Out',
        value: 1420,
        amount: r'$1,420',
        color: colors?.orangeColor ?? const Color(0xFFFA912A),
      ),
      PieChartItem(
        label: 'Transport',
        value: 1420,
        amount: r'$1,420',
        color: colors?.plumColor ?? const Color(0xFF9B3C6B),
      ),
      PieChartItem(
        label: 'Travel',
        value: 1420,
        amount: r'$1,420',
        color: colors?.lightBlueColor ?? const Color(0xFF83D1EC),
      ),
    ];

    return Scaffold(
      backgroundColor: colors?.surfaceVariant,
      appBar: AppBar(title: const Text('Pie Chart')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.xxxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Spacing.xxxl,
          children: [
            PieChartComponent(
              items: items,
              totalLabel: 'Total',
              totalAmount: r'$4,225',
            ),
            PieChartComponent(
              items: items,
              totalLabel: 'Total',
              totalAmount: r'$4,225',
              selectedIndex: 0,
            ),
          ],
        ),
      ),
    );
  }
}
