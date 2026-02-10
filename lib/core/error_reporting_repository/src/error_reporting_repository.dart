import 'dart:async';

import 'package:flutter/foundation.dart';

/// {@template CrashManager}
/// Abstract class defining the contract for crash reporting managers.
/// {@endtemplate}
abstract class ErrorReportingRepository {
  /// Initializes the crash manager
  Future<void> init();

  /// Record errors to crash reporting service
  Future<void> recordError(
    Object error, {
    bool fatal = false,
    StackTrace? stackTrace,
  });

  /// Sets the user identifier for crash reports
  Future<void> setUserIdentifier(String? identifier);

  /// Handles Flutter errors from [FlutterError.onError]
  Future<void> handleFlutterError(FlutterErrorDetails details) async {
    await recordError(
      details.exception,
      fatal: true,
    );
  }
}
