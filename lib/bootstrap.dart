import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finance_app/core/crash/crash.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver({required this.crashManager});

  final CrashManager crashManager;

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  Future<void> onError(
    BlocBase<dynamic> bloc,
    Object error,
    StackTrace stackTrace,
  ) async {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    await crashManager.recordError(error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap({
  required FutureOr<Widget> Function() builder,
  required CrashManager crashManager,
}) async {
  await crashManager.init();

  FlutterError.onError = crashManager.handleFlutterError;

  Bloc.observer = AppBlocObserver(crashManager: crashManager);

  runApp(await builder());
}
