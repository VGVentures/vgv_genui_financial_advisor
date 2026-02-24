import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SelectableOptionCard extends StatelessWidget {
  const SelectableOptionCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isMobile = false,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final themeOf = Theme.of(context);
    final colorScheme = themeOf.colorScheme;
    final colorExtension = themeOf.extension<AppColors>();
    final textTheme = themeOf.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected
              ? colorExtension?.secondary.shade300
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(Spacing.lg),
          border: Border.all(
            color:
                (isSelected
                    ? colorExtension?.secondary.shade600
                    : colorExtension?.secondary.shade50) ??
                colorScheme.primary,
            width: _Dimensions.borderWidth,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: isMobile
                ? _Dimensions.mobileVerticalPadding
                : _Dimensions.verticalPadding,
            horizontal: isMobile ? Spacing.xs : _Dimensions.horizontalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSelected) ...[
                Assets.images.onboarding.checkedOption.image(
                  width: isMobile ? Spacing.lg : _Dimensions.iconSize,
                  height: isMobile ? Spacing.lg : _Dimensions.iconSize,
                ),
                const SizedBox(width: Spacing.md),
              ],
              Flexible(
                child: Text(
                  label,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: isMobile
                        ? _Dimensions.mobileTextSize
                        : Spacing.xxxl,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: colorScheme.primary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract final class _Dimensions {
  static const double iconSize = 40;
  static const double borderWidth = 2;
  static const double horizontalPadding = 40;
  static const double verticalPadding = 44;
  static const double mobileVerticalPadding = 17;
  static const double mobileTextSize = 18;
}
