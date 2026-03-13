import 'package:finance_app/app/presentation.dart';
import 'package:genui/genui.dart';
import 'package:json_schema_builder/json_schema_builder.dart';

const _colorValues = [
  'pink',
  'mustard',
  'orange',
  'brightOrange',
  'deepRed',
  'plum',
  'aqua',
  'lightBlue',
  'lightOlive',
  'darkOlive',
  'emerald',
];

final _schema = S.object(
  description:
      'A horizontal bar of filter chips for narrowing data by category '
      '(e.g. spending categories, account types).',
  properties: {
    'categories': S.list(
      description: 'List of filter category chips to display.',
      items: S.object(
        properties: {
          'label': S.string(description: 'Display text for the chip.'),
          'color': S.string(
            description: 'Chip color.',
            enumValues: _colorValues,
          ),
          'isSelected': S.boolean(
            description: 'Whether the chip is selected.',
          ),
        },
        required: ['label', 'color', 'isSelected'],
      ),
    ),
    'action': A2uiSchemas.action(
      description: 'The action to perform when a filter category is toggled.',
    ),
  },
  required: ['categories', 'action'],
);

FilterChipColor _parseColor(String value) {
  return switch (value) {
    'mustard' => FilterChipColor.mustard,
    'orange' => FilterChipColor.orange,
    'brightOrange' => FilterChipColor.brightOrange,
    'deepRed' => FilterChipColor.deepRed,
    'plum' => FilterChipColor.plum,
    'aqua' => FilterChipColor.aqua,
    'lightBlue' => FilterChipColor.lightBlue,
    'lightOlive' => FilterChipColor.lightOlive,
    'darkOlive' => FilterChipColor.darkOlive,
    'emerald' => FilterChipColor.emerald,
    _ => FilterChipColor.pink,
  };
}

/// CatalogItem that renders a [FilterBar] widget.
final filterBarItem = CatalogItem(
  name: 'FilterBar',
  dataSchema: _schema,
  widgetBuilder: (ctx) {
    final json = ctx.data as Map<String, Object?>;
    final rawCategories = json['categories']! as List;
    final action = json['action'] as Map<String, Object?>?;

    final categories = rawCategories.cast<Map<String, Object?>>().map((c) {
      return FilterCategory(
        label: c['label']! as String,
        color: _parseColor(c['color']! as String),
        isSelected: c['isSelected']! as bool,
      );
    }).toList();

    void dispatchFilterEvent(String label) {
      if (action case {'event': final Map<String, Object?> event}) {
        ctx.dispatchEvent(
          UserActionEvent(
            name: event['name']! as String,
            sourceComponentId: ctx.id,
            context: {
              ...?event['context'] as Map<String, Object?>?,
              'label': label,
            },
          ),
        );
      }
    }

    return FilterBar(
      categories: categories,
      onCategoryToggled: (index) {
        dispatchFilterEvent(categories[index].label);
      },
      onAllToggled: () {
        dispatchFilterEvent('All');
      },
    );
  },
);
