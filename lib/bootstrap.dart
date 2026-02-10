import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finance_app/core/error_reporting_repository/error_reporting_repository.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(
    BlocBase<dynamic> bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap({
  required FutureOr<Widget> Function() builder,
  required ErrorReportingRepository errorReportingRepository,
}) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await errorReportingRepository.init();

      FlutterError.onError = errorReportingRepository.handleFlutterError;

      Bloc.observer = const AppBlocObserver();

      runApp(await builder());
    },
    (error, stackTrace) async {
      await errorReportingRepository.recordError(
        error,
        fatal: true,
        stackTrace: stackTrace,
      );
    },
  );
}
