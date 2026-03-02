enum FilterChipColor {
  grey,
  pink,
  mustard,
  orange,
  brightOrange,
  deepRed,
  plum,
  aqua,
  lightBlue,
  lightOlive,
  darkOlive,
  emerald,
}

extension FilterChipColorX on FilterChipColor {
  /// Aqua and Light Olive are too light for white text to be legible
  /// when selected.
  bool get useDarkTextWhenSelected =>
      this == FilterChipColor.aqua || this == FilterChipColor.lightOlive;
}
