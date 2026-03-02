import 'package:finance_app/app/presentation/filter_chip_color.dart';
import 'package:flutter/material.dart';

abstract final class FilterChipPalette {
  static const Map<FilterChipColor, Color> baseColors = {
    FilterChipColor.grey: Color(0xFFAAABAB),
    FilterChipColor.pink: Color(0xFFE98AD4),
    FilterChipColor.mustard: Color(0xFFF2C01C),
    FilterChipColor.orange: Color(0xFFFA912A),
    FilterChipColor.brightOrange: Color(0xFFF6602D),
    FilterChipColor.deepRed: Color(0xFF882003),
    FilterChipColor.plum: Color(0xFF9B3C6B),
    FilterChipColor.aqua: Color(0xFFAFEEF0),
    FilterChipColor.lightBlue: Color(0xFF83D1EC),
    FilterChipColor.lightOlive: Color(0xFFC1D112),
    FilterChipColor.darkOlive: Color(0xFF486731),
    FilterChipColor.emerald: Color(0xFF0D3823),
  };
}
