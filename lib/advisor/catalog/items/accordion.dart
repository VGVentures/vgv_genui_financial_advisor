import 'package:finance_app/app/presentation/widgets/accordion.dart';
import 'package:flutter/material.dart';
import 'package:genui/genui.dart';
import 'package:json_schema_builder/json_schema_builder.dart';

final _schema = S.object(
  properties: {
    'title': S.string(description: 'Header text displayed in the accordion.'),
    'body': S.string(
      description: 'Text content shown when the accordion is expanded.',
    ),
    'isExpanded': S.boolean(
      description:
          'Whether the accordion starts in expanded state. Defaults to false.',
    ),
  },
  required: ['title', 'body'],
);

/// CatalogItem that renders an expandable/collapsible accordion panel.
final accordionItem = CatalogItem(
  name: 'AppAccordion',
  dataSchema: _schema,
  widgetBuilder: (ctx) {
    final json = ctx.data as Map<String, Object?>;

    final title = json['title']! as String;
    final body = json['body']! as String;
    final isExpanded = (json['isExpanded'] as bool?) ?? false;

    return AppAccordion(
      title: title,
      isExpanded: isExpanded,
      content: Text(body),
    );
  },
);
