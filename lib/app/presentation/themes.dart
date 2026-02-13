import 'package:finance_app/app/presentation.dart';

class AppThemes {
  static Theme get light => LightTheme();

  static Theme get dark => DarkTheme();

  static Theme getAppTheme(ThemeType themeType) {
    return switch (themeType) {
      ThemeType.light => light,
      ThemeType.dark => dark,
    };
  }
}

class LightTheme extends Theme {
  LightTheme()
    : super(
        themeData: AppTheme(
          LightThemeColors(),
        ),
      );
}

class DarkTheme extends Theme {
  DarkTheme()
    : super(
        themeData: AppTheme(
          DarkThemeColors(),
        ),
      );
}
