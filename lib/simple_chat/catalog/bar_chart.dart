import 'package:fl_chart/fl_chart.dart' as fl;
import 'package:flutter/material.dart';
import 'package:genui/genui.dart';
import 'package:json_schema_builder/json_schema_builder.dart';

final _schema = S.object(
  description:
      'A bar chart for comparing values. Set orientation to "vertical" '
      '(bars bottom-to-top) on mobile or "horizontal" (bars left-to-right) '
      'on desktop.',
  properties: {
    'component': S.string(enumValues: ['BarChart']),
    'title': A2uiSchemas.stringReference(
      description: 'An optional chart title.',
    ),
    'orientation': S.string(
      enumValues: ['vertical', 'horizontal'],
      description:
          'The bar orientation. Use "vertical" on mobile and '
          '"horizontal" on desktop.',
    ),
    'bars': S.list(
      description: 'The list of bars to display.',
      items: S.object(
        properties: {
          'label': A2uiSchemas.stringReference(
            description: 'The label for this bar.',
          ),
          'value': S.number(
            description: 'The numeric value for this bar.',
          ),
        },
        required: ['label', 'value'],
      ),
    ),
  },
  required: ['component', 'bars'],
);

extension type _ChartData.fromMap(Map<String, Object?> _json) {
  Object? get title => _json['title'];
  String get orientation =>
      (_json['orientation'] as String?) ?? 'vertical';
  List<Object?> get bars => _json['bars'] as List<Object?>;
}

extension type _BarEntry.fromMap(Map<String, Object?> _json) {
  Object get label => _json['label'] as Object;
  double get value => (_json['value'] as num).toDouble();
}

final barChart = CatalogItem(
  name: 'BarChart',
  isImplicitlyFlexible: true,
  dataSchema: _schema,
  exampleData: [
    () => '''
      [
        {
          "id": "root",
          "component": "BarChart",
          "title": "Monthly Sales",
          "orientation": "vertical",
          "bars": [
            { "label": "Jan", "value": 30 },
            { "label": "Feb", "value": 45 },
            { "label": "Mar", "value": 28 }
          ]
        }
      ]
    ''',
  ],
  widgetBuilder: (context) {
    final data = _ChartData.fromMap(
      context.data as Map<String, Object?>,
    );

    final ValueNotifier<String?> titleNotifier =
        context.dataContext.subscribeToString(data.title);

    final List<_BarEntry> entries = data.bars
        .whereType<Map<String, Object?>>()
        .map(_BarEntry.fromMap)
        .toList();

    return _BarChartWidget(
      titleNotifier: titleNotifier,
      entries: entries,
      dataContext: context.dataContext,
      isHorizontal: data.orientation == 'horizontal',
    );
  },
);

class _BarChartWidget extends StatelessWidget {
  const _BarChartWidget({
    required this.titleNotifier,
    required this.entries,
    required this.dataContext,
    required this.isHorizontal,
  });

  final ValueNotifier<String?> titleNotifier;
  final List<_BarEntry> entries;
  final DataContext dataContext;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double maxValue = entries.fold<double>(
      0,
      (max, e) => e.value > max ? e.value : max,
    );

    final labelAxis = fl.AxisTitles(
      sideTitles: fl.SideTitles(
        showTitles: true,
        reservedSize: isHorizontal ? 80 : 32,
        getTitlesWidget: (double value, fl.TitleMeta meta) {
          final int index = value.toInt();
          if (index < 0 || index >= entries.length) {
            return const SizedBox.shrink();
          }
          return _BarLabel(
            entry: entries[index],
            dataContext: dataContext,
          );
        },
      ),
    );

    const valueAxis = fl.AxisTitles(
      sideTitles: fl.SideTitles(
        showTitles: true,
        reservedSize: 40,
      ),
    );

    const hiddenAxis = fl.AxisTitles(
      sideTitles: fl.SideTitles(showTitles: false),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder<String?>(
              valueListenable: titleNotifier,
              builder: (context, title, _) {
                if (title == null) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    title,
                    style:
                        Theme.of(context).textTheme.titleMedium,
                  ),
                );
              },
            ),
            SizedBox(
              height: isHorizontal
                  ? entries.length * 48.0 + 24
                  : 200,
              child: fl.BarChart(
                fl.BarChartData(
                  alignment: fl.BarChartAlignment.spaceAround,
                  maxY: maxValue * 1.2,
                  barTouchData: const fl.BarTouchData(
                    enabled: false,
                  ),
                  rotationQuarterTurns: isHorizontal ? 1 : 0,
                  titlesData: fl.FlTitlesData(
                    topTitles: hiddenAxis,
                    rightTitles: hiddenAxis,
                    bottomTitles: labelAxis,
                    leftTitles:
                        isHorizontal ? hiddenAxis : valueAxis,
                  ),
                  borderData: fl.FlBorderData(show: false),
                  gridData: fl.FlGridData(
                    drawVerticalLine: isHorizontal,
                    drawHorizontalLine: !isHorizontal,
                  ),
                  barGroups: [
                    for (int i = 0; i < entries.length; i++)
                      fl.BarChartGroupData(
                        x: i,
                        barRods: [
                          fl.BarChartRodData(
                            toY: entries[i].value,
                            color: colorScheme.primary,
                            width: isHorizontal ? 24 : 20,
                            borderRadius: isHorizontal
                                ? const BorderRadius.horizontal(
                                    right: Radius.circular(4),
                                  )
                                : const BorderRadius.vertical(
                                    top: Radius.circular(4),
                                  ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarLabel extends StatelessWidget {
  const _BarLabel({
    required this.entry,
    required this.dataContext,
  });

  final _BarEntry entry;
  final DataContext dataContext;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String?> notifier =
        dataContext.subscribeToString(entry.label);

    return ValueListenableBuilder<String?>(
      valueListenable: notifier,
      builder: (context, label, _) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          label ?? '',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
