import 'package:finance_app/core/error_reporting_repository/src/error_reporting_repository.dart';
import 'package:flutter/foundation.dart';

/// {@template DevCrashManager}
/// Development implementation of [ErrorReportingRepository].
/// {@endtemplate}
class DevErrorReportingRepositoryImpl extends ErrorReportingRepository {
  String? _userIdentifier;

  @override
  Future<void> init() async {
    debugPrint('ErrorReportingRepository Initialized in development mode');
  }

  @override
  Future<void> recordError(
    Object error, {
    StackTrace? stackTrace,
    bool fatal = false,
  }) async {
    final severity = fatal ? 'FATAL' : 'ERROR';
    debugPrint('[$severity] $error');
    if (stackTrace != null) {
      debugPrint('[STACKTRACE] $stackTrace');
    }
    if (_userIdentifier != null) {
      debugPrint('[USER] $_userIdentifier');
    }
  }

  @override
  Future<void> setUserIdentifier(String? identifier) async {
    _userIdentifier = identifier;
    debugPrint('User identifier set: $identifier');
  }
}
