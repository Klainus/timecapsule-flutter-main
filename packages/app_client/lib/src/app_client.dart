// ignore_for_file: use_setters_to_change_properties

import 'dart:async';

import 'package:app_api/app_api.dart';
import 'package:app_client/app_client.dart';
import 'package:meta/meta.dart';
import 'package:mutex/mutex.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sentry_dio/sentry_dio.dart';

class AppClient {
  AppClient({
    required String baseUrl,
    required CookieJar cookieJar,
    required void Function(Dio, CookieJar) addPlatformConfiguration,
    void Function(String?)? debugPrint,
  })  : csrfClient = Dio(),
        http = Dio() {
    final baseOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      validateStatus: (_) => true,
      baseUrl: baseUrl,
    );

    final loggingInterceptor = PrettyDioLogger(
      responseBody: false,
      logPrint: (object) {
        debugPrint?.call(object.toString());
      },
    );

    final logoutInterceptor = LogoutInterceptor(client: this);

    addPlatformConfiguration(csrfClient, cookieJar);

    csrfClient
      ..options = baseOptions
      ..interceptors.add(loggingInterceptor)
      ..addSentry();

    addPlatformConfiguration(http, cookieJar);

    final csrfInterceptor = CsrfInterceptor(
      csrfService: CsrfService(
        usersApi: UsersApi(csrfClient),
        mutex: Mutex(),
      ),
      retryService: RetryService(client: csrfClient),
    );

    http
      ..options = baseOptions
      ..interceptors.add(loggingInterceptor)
      ..interceptors.add(csrfInterceptor)
      ..interceptors.add(logoutInterceptor)
      ..addSentry();
  }

  @visibleForTesting
  final Dio csrfClient;
  final Dio http;

  final _controller = StreamController<AuthenticationStatus>.broadcast();

  AuthenticationStatus _currentStatus = AuthenticationStatus.initial;
  AuthenticationStatus get currentStatus => _currentStatus;

  Stream<AuthenticationStatus> get authenticationStatus async* {
    yield _currentStatus;
    yield* _controller.stream;
  }

  void _update(AuthenticationStatus value) {
    _currentStatus = value;
    _controller.add(value);
  }

  void authenticate() {
    _update(AuthenticationStatus.authenticated);
  }

  void unauthenticate() {
    _update(AuthenticationStatus.unauthenticated);
  }
}
