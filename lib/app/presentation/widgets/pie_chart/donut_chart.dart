import 'dart:math';

import 'package:finance_app/app/presentation.dart';
import 'package:flutter/material.dart';

class DonutChart extends StatelessWidget {
  const DonutChart({
    required this.items,
    required this.selectedIndex,
    required this.onSegmentHover,
    required this.onHoverExit,
    required this.amount,
    required this.label,
    required this.percentage,
    required this.colors,
    super.key,
  });

  final List<PieChartItem> items;
  final int? selectedIndex;
  final ValueChanged<int> onSegmentHover;
  final VoidCallback onHoverExit;
  final String amount;
  final String label;
  final String? percentage;
  final AppColors? colors;

  int? _hitSegment(Offset localPosition) {
    final total = items.fold<double>(0, (sum, item) => sum + item.value);
    if (total == 0) return null;

    const center = Offset(
      _Dimensions.donutSize / 2,
      _Dimensions.donutSize / 2,
    );
    final distance = (localPosition - center).distance;
    const outerRadius = _Dimensions.donutSize / 2;
    const innerRadius = outerRadius - _Dimensions.strokeWidth;

    if (distance < innerRadius || distance > outerRadius) return null;

    var angle =
        atan2(
          localPosition.dy - center.dy,
          localPosition.dx - center.dx,
        ) +
        pi / 2;
    if (angle < 0) angle += 2 * pi;

    double cumulative = 0;
    for (var i = 0; i < items.length; i++) {
      cumulative += items[i].value / total * 2 * pi;
      if (angle <= cumulative) return i;
    }
    return null;
  }

  void _onHover(PointerEvent event) {
    final index = _hitSegment(event.localPosition);
    if (index != null) {
      onSegmentHover(index);
    } else {
      onHoverExit();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: _Dimensions.donutSize,
      height: _Dimensions.donutSize,
      child: MouseRegion(
        onHover: _onHover,
        onExit: (_) => onHoverExit(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(
                _Dimensions.donutSize,
                _Dimensions.donutSize,
              ),
              painter: DonutPainter(
                items: items,
                selectedIndex: selectedIndex,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (percentage != null)
                  Text(
                    label,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors?.onSurfaceVariant,
                    ),
                  ),
                Text(
                  amount,
                  style: textTheme.headlineMedium?.copyWith(
                    color: colors?.onSurface,
                  ),
                ),
                Text(
                  percentage ?? label,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors?.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Paints a donut chart with arcs for each [PieChartItem].
@visibleForTesting
class DonutPainter extends CustomPainter {
  /// Creates a [DonutPainter].
  const DonutPainter({required this.items, this.selectedIndex});

  /// The segments to paint.
  final List<PieChartItem> items;

  /// The currently selected segment index.
  final int? selectedIndex;

  @override
  void paint(Canvas canvas, Size size) {
    final total = items.fold<double>(0, (sum, item) => sum + item.value);
    if (total == 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    const strokeWidth = _Dimensions.strokeWidth;
    final radius = size.width / 2 - strokeWidth / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    var startAngle = -pi / 2;

    for (var i = 0; i < items.length; i++) {
      final sweepAngle = (items[i].value / total) * 2 * pi;
      final gap = items.length > 1 ? _Dimensions.segmentGap : 0.0;
      final actualSweep = sweepAngle - gap;

      final paint = Paint()
        ..color = items[i].color
        ..style = PaintingStyle.stroke
        ..strokeWidth = i == selectedIndex
            ? strokeWidth + _Dimensions.selectedStrokeExtra
            : strokeWidth
        ..strokeCap = StrokeCap.butt;

      if (actualSweep > 0) {
        canvas.drawArc(
          rect,
          startAngle + gap / 2,
          actualSweep,
          false,
          paint,
        );
      }
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(DonutPainter oldDelegate) =>
      oldDelegate.items != items || oldDelegate.selectedIndex != selectedIndex;
}

abstract final class _Dimensions {
  static const double donutSize = 210;
  static const double strokeWidth = 41;
  static const double selectedStrokeExtra = 8;
  static const double segmentGap = 0.03;
}
