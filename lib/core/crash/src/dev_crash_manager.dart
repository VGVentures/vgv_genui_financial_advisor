import 'package:finance_app/core/crash/src/crash_manager.dart';
import 'package:flutter/foundation.dart';

/// {@template DevCrashManager}
/// Development implementation of [CrashManager].
/// {@endtemplate}
class DevCrashManager extends CrashManager {
  String? _userIdentifier;

  @override
  Future<void> init() async {
    debugPrint('CrashManager Initialized in development mode');
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
