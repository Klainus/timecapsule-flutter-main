import 'dart:async';

import 'package:app_logging/app_logging.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

typedef AppRunner = FutureOr<void> Function();

class ErrorTracking {
  static const _sentryDsn = '';

  static Future<void> init({
    required String environment,
    required AppRunner appRunner,
    bool debug = false,
  }) async {
    await SentryFlutter.init(
      (options) {
        options
          ..debug = debug
          ..diagnosticLevel = SentryLevel.error
          ..dsn = debug ? '' : _sentryDsn
          ..environment = environment
          ..maxRequestBodySize = MaxRequestBodySize.small
          ..maxResponseBodySize = MaxResponseBodySize.small
          ..addIntegration(AppLogging.sentryIntegration);
      },
      appRunner: appRunner,
    );
  }
}
