import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/gen/assets.gen.dart';
import 'package:finance_app/gen/fonts.gen.dart';
import 'package:finance_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class GenUiBadge extends StatelessWidget {
  const GenUiBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final themeOf = Theme.of(context);
    final textTheme = themeOf.textTheme;
    final colorExtension = themeOf.extension<AppColors>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorExtension?.primary.shade50,
        borderRadius: BorderRadius.circular(_Dimensions.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.md,
          vertical: Spacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.onboarding.softStar.image(
              width: _Dimensions.starSize,
              height: _Dimensions.starSize,
            ),
            const SizedBox(width: _Dimensions.gapBetweenStarAndLabel),
            Text(
              l10n.genUILabel,
              style: textTheme.displayLarge?.copyWith(
                fontFamily: FontFamily.poppins,
                fontWeight: FontWeight.w700,
                color: colorExtension?.primary.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract final class _Dimensions {
  static const double borderRadius = 150;
  static const double starSize = 30;
  static const double gapBetweenStarAndLabel = 6;
}
