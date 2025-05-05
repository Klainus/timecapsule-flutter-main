import 'dart:developer';

import 'package:logging/logging.dart';
import 'package:sentry_logging/sentry_logging.dart';

abstract class AppLogging {
  static Logger logger = Logger.root;

  static void init({bool debug = false}) {
    if (debug) {
      logger.level = Level.INFO;
    } else {
      logger.level = Level.FINE;
    }

    logger.onRecord.listen(
      (record) => log(
        record.message,
        error: record.error,
        stackTrace: record.stackTrace,
      ),
    );
  }

  static final sentryIntegration = LoggingIntegration(
    minBreadcrumbLevel: Level.FINE,
  );
}
