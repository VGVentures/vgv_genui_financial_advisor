import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class GradientChip extends StatelessWidget {
  const GradientChip({
    required this.gradient,
    required this.asset,
    required this.onTap,
    this.label,
    super.key,
  });

  final LinearGradient gradient;
  final SvgGenImage asset;
  final String? label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: label ?? '',
      leadingIcon: asset.svg(
        height: _Dimensions.iconHeight,
        width: Spacing.md,
      ),
      onPressed: onTap,
      variant: AppButtonVariant.gradient,
    );
  }
}

abstract final class _Dimensions {
  static const double iconHeight = 19;
}
