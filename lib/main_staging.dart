import 'package:finance_app/app/app.dart';
import 'package:finance_app/bootstrap.dart';
import 'package:finance_app/core/crash/crash.dart';

Future<void> main() async {
  await bootstrap(
    builder: () => const App(),
    crashManager: DevCrashManager(),
  );
}
