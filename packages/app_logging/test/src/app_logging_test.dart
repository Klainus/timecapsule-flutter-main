// ignore_for_file: prefer_const_constructors
import 'package:app_logging/app_logging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:sentry_logging/sentry_logging.dart';

void main() {
  group('AppLogging', () {
    test('init returns normally', () {
      expect(AppLogging.init, returnsNormally);
    });

    test('sentry integration can be instantiated', () {
      expect(
        AppLogging.sentryIntegration,
        isA<LoggingIntegration>(),
      );
    });

    test('logs records with severity of INFO and higher in debug mode', () {
      AppLogging.init(debug: true);

      final records = <LogRecord>[];

      final subscription = AppLogging.logger.onRecord.listen(records.add);

      AppLogging.logger.log(Level.INFO, 'message');
      AppLogging.logger.log(Level.FINE, 'message');

      subscription.cancel();

      expect(records, hasLength(1));
    });

    test(
        'logs records with severity of FINE and higher '
        'when not in debug mode', () {
      AppLogging.init();

      final records = <LogRecord>[];

      final subscription = AppLogging.logger.onRecord.listen(records.add);

      AppLogging.logger.log(Level.INFO, 'message');
      AppLogging.logger.log(Level.FINE, 'message');

      subscription.cancel();

      expect(records, hasLength(2));
    });
  });
}
