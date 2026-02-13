import 'dart:math';

import 'package:finance_app/core/error_reporting_repository/error_reporting_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInitializer {
  AppInitializer(this.errorRepo);

  final ErrorReportingRepository errorRepo;

  Future<void> init() async {
    await errorRepo.init();

    final deviceId = await _getOrCreateDeviceId();
    await errorRepo.setUserIdentifier(deviceId);

    debugPrint('App initialized with device ID: $deviceId');
  }

  Future<String> _getOrCreateDeviceId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final existingId = prefs.getString('device_id');

      if (existingId != null && existingId.isNotEmpty) {
        return existingId;
      }

      const platform = kIsWeb ? 'web' : 'android';
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final randomId = Random().nextInt(9999).toString().padLeft(4, '0');
      final newId = '${platform}_${timestamp}_$randomId';

      await prefs.setString('device_id', newId);
      return newId;
    } on Exception catch (e) {
      debugPrint('Failed to get/create device ID: $e');
      const platform = kIsWeb ? 'web' : 'android';
      return '${platform}_fallback_${DateTime.now().millisecondsSinceEpoch}';
    }
  }
}
