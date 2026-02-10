import 'package:finance_app/app/app.dart';
import 'package:finance_app/bootstrap.dart';
import 'package:finance_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await bootstrap(() => const App());
}
