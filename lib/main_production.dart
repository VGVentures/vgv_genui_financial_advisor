import 'package:finance_app/bootstrap.dart';
import 'package:finance_app/error_reporting/error_reporting.dart';

Future<void> main() async {
  await bootstrap(errorReportingRepository: DevErrorReportingRepository());
}
