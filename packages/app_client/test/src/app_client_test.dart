// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: prefer_const_constructors
// ignore_for_file: cascade_invocations

import 'package:app_client/app_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test/test.dart';

class _MockCookieJar extends Mock implements CookieJar {}

void main() {
  const baseUrl = 'https://example.com';

  group(AppClient, () {
    late CookieJar cookieJar;

    setUp(() {
      cookieJar = _MockCookieJar();
    });

    AppClient createSubject({
      void Function(Dio, CookieJar)? addPlatformConfiguration,
      void Function(String?)? debugPrint,
    }) {
      return AppClient(
        baseUrl: baseUrl,
        cookieJar: cookieJar,
        addPlatformConfiguration: addPlatformConfiguration ?? (_, __) {},
        debugPrint: debugPrint,
      );
    }

    group('csrfClient', () {
      group('options', () {
        group('connectTimeout', () {
          test('is correct $Duration', () {
            final client = createSubject();
            expect(
              client.csrfClient.options.connectTimeout,
              Duration(milliseconds: 10000),
            );
          });
        });

        group('receiveTimeout', () {
          test('is correct $Duration', () {
            final client = createSubject();
            expect(
              client.csrfClient.options.receiveTimeout,
              Duration(milliseconds: 10000),
            );
          });
        });

        group('validateStatus', () {
          test('always returns true', () {
            final client = createSubject();
            expect(client.csrfClient.options.validateStatus(200), true);
            expect(client.csrfClient.options.validateStatus(300), true);
            expect(client.csrfClient.options.validateStatus(400), true);
            expect(client.csrfClient.options.validateStatus(500), true);
          });
        });

        group('baseUrl', () {
          test('is correct string', () {
            final client = createSubject();
            expect(client.csrfClient.options.baseUrl, baseUrl);
          });
        });
      });

      group('interceptors', () {
        test('contains $PrettyDioLogger', () {
          final client = createSubject();
          expect(
            client.csrfClient.interceptors,
            contains(
              isA<PrettyDioLogger>(),
            ),
          );
        });

        test('$PrettyDioLogger logPrint calls debugPrint', () {
          String? printed;

          void debugPrint(String? object) {
            printed = object;
          }

          final client = createSubject(
            debugPrint: debugPrint,
          );

          const object = 'object';

          client.csrfClient.interceptors
              .whereType<PrettyDioLogger>()
              .first
              .logPrint(object);

          expect(printed, object);
        });

        test('does not contain $CsrfInterceptor', () {
          final client = createSubject();
          expect(
            client.csrfClient.interceptors.whereType<CsrfInterceptor>(),
            isEmpty,
          );
        });

        test('does not contain $LogoutInterceptor', () {
          final client = createSubject();
          expect(
            client.csrfClient.interceptors.whereType<LogoutInterceptor>(),
            isEmpty,
          );
        });
      });

      group('platform configuration', () {
        test('is added', () {
          final calls = <(Dio, CookieJar)>[];

          final client = createSubject(
            addPlatformConfiguration: (dio, cookieJar) {
              calls.add((dio, cookieJar));
            },
          );

          expect(
            calls,
            contains(
              (client.csrfClient, cookieJar),
            ),
          );
        });
      });
    });

    group('http', () {
      group('options', () {
        group('connectTimeout', () {
          test('is correct $Duration', () {
            final client = createSubject();
            expect(
              client.http.options.connectTimeout,
              Duration(milliseconds: 10000),
            );
          });
        });

        group('receiveTimeout', () {
          test('is correct $Duration', () {
            final client = createSubject();
            expect(
              client.http.options.receiveTimeout,
              Duration(milliseconds: 10000),
            );
          });
        });

        group('validateStatus', () {
          test('always returns true', () {
            final client = createSubject();
            expect(client.http.options.validateStatus(200), true);
            expect(client.http.options.validateStatus(300), true);
            expect(client.http.options.validateStatus(400), true);
            expect(client.http.options.validateStatus(500), true);
          });
        });

        group('baseUrl', () {
          test('is correct string', () {
            final client = createSubject();
            expect(client.http.options.baseUrl, baseUrl);
          });
        });
      });

      group('interceptors', () {
        test('third last is $PrettyDioLogger', () {
          final client = createSubject();
          final interceptors = client.http.interceptors;
          expect(
            interceptors.sublist(interceptors.length - 3)[0],
            isA<PrettyDioLogger>(),
          );
        });

        test('$PrettyDioLogger logPrint calls debugPrint', () {
          String? printed;

          void debugPrint(String? object) {
            printed = object;
          }

          final client = createSubject(
            debugPrint: debugPrint,
          );

          const object = 'object';

          client.http.interceptors
              .whereType<PrettyDioLogger>()
              .first
              .logPrint(object);

          expect(printed, object);
        });

        test('second last is $CsrfInterceptor', () {
          final client = createSubject();
          final interceptors = client.http.interceptors;
          expect(
            interceptors.sublist(interceptors.length - 3)[1],
            isA<CsrfInterceptor>(),
          );
        });

        test('last is $LogoutInterceptor', () {
          final client = createSubject();
          final interceptors = client.http.interceptors;
          expect(
            interceptors.sublist(interceptors.length - 3)[2],
            isA<LogoutInterceptor>(),
          );
        });
      });

      group('platform configuration', () {
        test('is added', () {
          final calls = <(Dio, CookieJar)>[];

          final client = createSubject(
            addPlatformConfiguration: (dio, cookieJar) {
              calls.add((dio, cookieJar));
            },
          );

          expect(
            calls,
            contains(
              (client.http, cookieJar),
            ),
          );
        });
      });
    });

    group('authenticationStatus', () {
      test(
          'first emits currentStatus and then emits '
          'authentication status updates', () async {
        final client = createSubject();
        expect(
          client.authenticationStatus,
          emitsInOrder([
            AuthenticationStatus.initial,
            AuthenticationStatus.authenticated,
          ]),
        );
        await Future<void>.delayed(Duration.zero);
        client.authenticate();
      });
    });

    group('authenticate', () {
      test(
          'updates currentStatus to '
          '${AuthenticationStatus.authenticated}', () {
        final client = createSubject();
        client.authenticate();
        expect(
          client.currentStatus,
          AuthenticationStatus.authenticated,
        );
      });

      test('emits ${AuthenticationStatus.authenticated}', () {
        final client = createSubject();
        expect(
          client.authenticationStatus,
          emits(AuthenticationStatus.authenticated),
        );
        client.authenticate();
      });
    });

    group('unauthenticate', () {
      test(
          'updates currentStatus to '
          '${AuthenticationStatus.unauthenticated}', () {
        final client = createSubject();
        client.unauthenticate();
        expect(
          client.currentStatus,
          AuthenticationStatus.unauthenticated,
        );
      });

      test('emits ${AuthenticationStatus.unauthenticated}', () {
        final client = createSubject();
        expect(
          client.authenticationStatus,
          emits(AuthenticationStatus.unauthenticated),
        );
        client.unauthenticate();
      });
    });
  });
}
