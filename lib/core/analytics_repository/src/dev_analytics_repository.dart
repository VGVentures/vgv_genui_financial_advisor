import 'dart:developer' as developer;

import 'package:finance_app/core/analytics_repository/src/analytics_repository.dart';
import 'package:flutter/widgets.dart';

/// Signature for a logging function.
typedef LogFunction = void Function(String message);

/// {@template DevAnalyticsRepository}
/// Development implementation of [AnalyticsRepository].
/// Prints analytics events to the console for debugging.
/// {@endtemplate}
class DevAnalyticsRepository extends AnalyticsRepository {
  /// {@macro DevAnalyticsRepository}
  DevAnalyticsRepository({LogFunction? log}) : _log = log ?? developer.log;

  final LogFunction _log;

  static const initLogMessage = 'DevAnalyticsRepository initialized';
  static const trackEventLogMessage = 'Analytics Event:';
  static const setUserIdLogMessage = 'Analytics User ID set:';

  @override
  Future<void> init() async {
    _log(initLogMessage);
  }

  @override
  Future<void> trackEvent(
    String name, {
    Map<String, Object>? parameters,
  }) async {
    _log('$trackEventLogMessage $name, parameters: $parameters');
  }

  @override
  Future<void> setUserId(String? userId) async {
    _log('$setUserIdLogMessage $userId');
  }

  @override
  NavigatorObserver get navigationObserver => _NoOpNavigatorObserver();
}

class _NoOpNavigatorObserver extends NavigatorObserver {}
