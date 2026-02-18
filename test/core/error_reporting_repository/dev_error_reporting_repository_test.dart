import 'package:finance_app/core/error_reporting_repository/src/dev_error_reporting_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DevErrorReportingRepository repository;

  setUp(() {
    repository = DevErrorReportingRepository();
  });

  group('DevErrorReportingRepository', () {
    test('recordError logs error without throwing', () async {
      final error = Exception('Test error');
      final stackTrace = StackTrace.current;

      await expectLater(
        repository.recordError(
          error,
          stackTrace,
          reason: 'Test reason',
          extra: {'key': 'value'},
        ),
        completes,
      );
    });
  });
}
