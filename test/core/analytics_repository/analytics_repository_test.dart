import 'package:finance_app/core/analytics_repository/analytics_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wiredash/wiredash.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class MockWiredashAnalytics extends Mock implements WiredashAnalytics {}

void main() {
  group('DevAnalyticsRepository', () {
    late DevAnalyticsRepository repository;
    late List<String> logMessages;

    void captureLog(String message) {
      logMessages.add(message);
    }

    setUp(() {
      logMessages = [];
      repository = DevAnalyticsRepository(log: captureLog);
    });

    test('init logs initialization message', () async {
      await repository.init();

      expect(logMessages, contains(DevAnalyticsRepository.initLogMessage));
    });

    test('trackEvent logs event name and parameters', () async {
      await repository.trackEvent('test_event', parameters: {'key': 'value'});

      expect(
        logMessages,
        contains(
          '${DevAnalyticsRepository.trackEventLogMessage} test_event, '
          'parameters: {key: value}',
        ),
      );
    });

    test('trackEvent logs event without parameters', () async {
      await repository.trackEvent('test_event');

      expect(
        logMessages,
        contains(
          '${DevAnalyticsRepository.trackEventLogMessage} test_event, '
          'parameters: null',
        ),
      );
    });

    test('setUserId logs the correct userId', () async {
      await repository.setUserId('user123');

      expect(
        logMessages,
        contains('${DevAnalyticsRepository.setUserIdLogMessage} user123'),
      );
    });

    test('setUserId logs null when userId is null', () async {
      await repository.setUserId(null);

      expect(
        logMessages,
        contains('${DevAnalyticsRepository.setUserIdLogMessage} null'),
      );
    });

    test('navigationObserver returns a NavigatorObserver', () {
      expect(repository.navigationObserver, isA<NavigatorObserver>());
    });
  });

  group('ProdAnalyticsRepository', () {
    late ProdAnalyticsRepository repository;
    late MockFirebaseAnalytics mockFirebaseAnalytics;
    late MockWiredashAnalytics mockWiredashAnalytics;

    void stubFirebaseLogEvent() {
      when(
        () => mockFirebaseAnalytics.logEvent(
          name: any(named: 'name'),
          parameters: any(named: 'parameters'),
        ),
      ).thenAnswer((_) async {});
    }

    void stubWiredashTrackEvent() {
      when(
        () => mockWiredashAnalytics.trackEvent(
          any(),
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async {});
    }

    void stubFirebaseSetUserId() {
      when(
        () => mockFirebaseAnalytics.setUserId(id: any(named: 'id')),
      ).thenAnswer((_) async {});
    }

    setUp(() {
      mockFirebaseAnalytics = MockFirebaseAnalytics();
      mockWiredashAnalytics = MockWiredashAnalytics();

      repository = ProdAnalyticsRepository(
        firebaseAnalytics: mockFirebaseAnalytics,
        wiredashAnalytics: mockWiredashAnalytics,
      );
    });

    test('init creates FirebaseAnalyticsObserver', () async {
      await repository.init();

      expect(repository.navigationObserver, isA<FirebaseAnalyticsObserver>());
    });

    group('trackEvent', () {
      setUp(() {
        stubFirebaseLogEvent();
        stubWiredashTrackEvent();
      });

      test('delegates to FirebaseAnalytics and WiredashAnalytics', () async {
        await repository.trackEvent('test_event', parameters: {'key': 'value'});

        verify(
          () => mockFirebaseAnalytics.logEvent(
            name: 'test_event',
            parameters: {'key': 'value'},
          ),
        ).called(1);

        verify(
          () => mockWiredashAnalytics.trackEvent(
            'test_event',
            data: {'key': 'value'},
          ),
        ).called(1);
      });

      test('delegates without parameters', () async {
        await repository.trackEvent('test_event');

        verify(
          () => mockFirebaseAnalytics.logEvent(name: 'test_event'),
        ).called(1);

        verify(
          () => mockWiredashAnalytics.trackEvent('test_event'),
        ).called(1);
      });
    });

    group('setUserId', () {
      setUp(stubFirebaseSetUserId);

      test('delegates to FirebaseAnalytics', () async {
        await repository.setUserId('user123');

        verify(
          () => mockFirebaseAnalytics.setUserId(id: 'user123'),
        ).called(1);
      });

      test('delegates null userId to FirebaseAnalytics', () async {
        await repository.setUserId(null);

        verify(() => mockFirebaseAnalytics.setUserId()).called(1);
      });
    });
  });
}
