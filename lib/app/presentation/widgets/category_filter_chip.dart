import 'package:finance_app/app/presentation/filter_chip_color.dart';
import 'package:finance_app/app/presentation/filter_chip_palette.dart';
import 'package:flutter/material.dart';

export 'package:finance_app/app/presentation/filter_chip_color.dart';

class CategoryFilterChip extends StatefulWidget {
  const CategoryFilterChip({
    required this.color,
    required this.label,
    required this.isSelected,
    this.onTap,
    this.isEnabled = true,
    super.key,
  });

  final FilterChipColor color;
  final String label;

  final bool? isSelected;

  final VoidCallback? onTap;
  final bool isEnabled;

  @override
  State<CategoryFilterChip> createState() => _CategoryFilterChipState();
}

class _CategoryFilterChipState extends State<CategoryFilterChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final baseColor = FilterChipPalette.baseColors[widget.color]!;
    final isDisabled = !widget.isEnabled;

    final Color backgroundColor;
    final Color textColor;
    final BoxBorder? border;

    if (isDisabled) {
      if (widget.isSelected == true) {
        backgroundColor = _Colors.disabledSelectedBackground;
        border = null;
      } else {
        backgroundColor = _Colors.disabledUnselectedBackground;
        border = Border.all(
          color: _Colors.disabledBorder,
        );
      }
      textColor = _Colors.disabledText;
    } else if (widget.isSelected == null) {
      backgroundColor = _Colors.defaultBackground;
      border = Border.all(
        color: baseColor,
      );
      textColor = _Colors.darkText;
    } else if (widget.isSelected == true) {
      backgroundColor = baseColor;
      border = null;
      textColor = widget.color.useDarkTextWhenSelected
          ? _Colors.darkText
          : Colors.white;
    } else {
      final opacity = _isHovered
          ? _Dimensions.hoveredOpacity
          : _Dimensions.defaultOpacity;
      backgroundColor = baseColor.withValues(alpha: opacity);
      border = Border.all(color: baseColor);
      textColor = _Colors.darkText;
    }

    return MouseRegion(
      onEnter: isDisabled ? null : (_) => setState(() => _isHovered = true),
      onExit: isDisabled ? null : (_) => setState(() => _isHovered = false),
      cursor: isDisabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isDisabled ? null : widget.onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: _Dimensions.minWidth),
          padding: const EdgeInsets.symmetric(
            horizontal: _Dimensions.horizontalPadding,
            vertical: _Dimensions.verticalPadding,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(_Dimensions.borderRadius),
            border: border,
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: _Dimensions.fontSize,
              height: _Dimensions.lineHeight / _Dimensions.fontSize,
              letterSpacing: _Dimensions.letterSpacing,
              leadingDistribution: TextLeadingDistribution.even,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

abstract final class _Colors {
  static const Color darkText = Color(0xFF5D5F5F);
  static const Color disabledText = Color(0xFFAAABAB);
  static const Color defaultBackground = Colors.white;
  static const Color disabledUnselectedBackground = Color(0xFFF0F1F1);
  static const Color disabledBorder = Color(0xFFE2E2E2);
  static const Color disabledSelectedBackground = Color(0xFFC6C6C7);
}

abstract final class _Dimensions {
  static const double minWidth = 116;
  static const double borderRadius = 32;
  static const double horizontalPadding = 16;
  static const double verticalPadding = 8;
  static const double fontSize = 16;
  static const double lineHeight = 20;
  static const double letterSpacing = -0.15;
  static const double defaultOpacity = 0.15;
  static const double hoveredOpacity = 0.20;
}
