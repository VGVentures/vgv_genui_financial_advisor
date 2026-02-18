import 'package:finance_app/app/app.dart';
import 'package:finance_app/bootstrap.dart';
import 'package:finance_app/core/error_reporting_repository/error_reporting_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  if (kDebugMode) {
    // Debug mode: Use console logging, skip Sentry initialization
    await bootstrap(
      builder: () => const App(),
      errorReportingRepository: DevErrorReportingRepository(),
    );
  } else {
    await SentryFlutter.init(
      (options) {
        options
          ..dsn =
              'https://75a71ac4db863a4e5fb99a10ca1d9343@o4510874275872768.ingest.us.sentry.io/4510874315390976'
          ..tracesSampleRate = 1.0
          ..environment = 'production';
      },
      appRunner: () => bootstrap(
        builder: () => const App(),
        errorReportingRepository: ProdErrorReportingRepository(HubAdapter()),
      ),
    );
  }
}
