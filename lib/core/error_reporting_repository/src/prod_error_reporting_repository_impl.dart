import 'package:finance_app/core/error_reporting_repository/src/error_reporting_repository.dart';

/// {@template ProdCrashManager}
/// Production environment implementation of [ErrorReportingRepository].
/// {@endtemplate}
class ProdErrorReportingRepositoryImpl extends ErrorReportingRepository {
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
