import 'package:finance_app/core/crash/src/crash_manager.dart';

/// {@template ProdCrashManager}
/// Production environment implementation of [CrashManager].
/// {@endtemplate}
class ProdCrashManager extends CrashManager {
  /// Initialize crash reporting service
  @override
  Future<void> init() async {}

  /// Report error to crash service
  @override
  Future<void> recordError(
    Object error, {
    StackTrace? stackTrace,
    bool fatal = false,
  }) async {
    // For example: await FirebaseCrashlytics.instance.recordError(
    //   error,
    //   stackTrace,
    //   fatal: fatal,
    // );
  }

  /// Set user identifier in crash service
  @override
  Future<void> setUserIdentifier(String? identifier) async {
    // For example:  await FirebaseCrashlytics.instance.setUserIdentifier
    // (identifier ?? '');
  }
}
