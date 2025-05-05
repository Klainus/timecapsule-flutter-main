// ignore_for_file: cascade_invocations
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_api/app_api.dart';
import 'package:app_client/app_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mutex/mutex.dart';
import 'package:test/test.dart';

class MockUsersApi extends Mock implements UsersApi {}

class MockMutex extends Mock implements Mutex {}

void main() {
  group(CsrfService, () {
    late UsersApi usersApi;
    late Mutex mutex;

    setUp(() {
      usersApi = MockUsersApi();
      mutex = MockMutex();
    });

    CsrfService buildSubject() {
      return CsrfService(
        usersApi: usersApi,
        mutex: mutex,
      );
    }

    group('headers', () {
      final uri = Uri.parse('https://example.com/endpoint');
      const csrfToken = 'csrfToken';

      test('returns $Map with correct keys and values', () {
        expect(
          CsrfService.headers(
            uri: uri,
            csrfToken: csrfToken,
          ),
          {
            'Origin': uri.origin,
            'X-CSRFToken': csrfToken,
          },
        );
      });
    });

    group('isProtectedMethod', () {
      test('returns true when method is POST', () {
        final service = buildSubject();
        expect(service.isProtectedMethod('POST'), true);
      });

      test('returns true when method is PUT', () {
        final service = buildSubject();
        expect(service.isProtectedMethod('PUT'), true);
      });

      test('returns true when method is DELETE', () {
        final service = buildSubject();
        expect(service.isProtectedMethod('DELETE'), true);
      });

      test('returns true when method is PATCH', () {
        final service = buildSubject();
        expect(service.isProtectedMethod('PATCH'), true);
      });

      test('returns false when method is GET', () {
        final service = buildSubject();
        expect(service.isProtectedMethod('GET'), false);
      });
    });

    group('isTokenInvalid', () {
      test('returns true when status is 403', () {
        final service = buildSubject();
        expect(service.isTokenInvalid(403), true);
      });

      test('returns false when status is not 400', () {
        final service = buildSubject();
        expect(service.isTokenInvalid(200), false);
      });

      test('returns false when status is null', () {
        final service = buildSubject();
        expect(service.isTokenInvalid(null), false);
      });
    });

    group('fetchCsrfToken', () {
      final usersCsrfRetrieve = () => usersApi.usersCsrfRetrieve();
      final protect = () => mutex.protect<String>(any());
      final csrf = CSRF(csrfToken: 'csrfToken');

      test(
          'returns csrfToken when lock has been aqcuired '
          'and csrfToken is not null', () async {
        when(protect).thenAnswer((_) async => '');

        const csrfToken = 'csrfToken';
        final service = buildSubject();
        service.csrfToken = csrfToken;

        await service.fetchCsrfToken();

        final callback = verify(
          () => mutex.protect<String>(captureAny<Future<String> Function()>()),
        ).captured.single as Future<String> Function();

        await expectLater(
          callback(),
          completion(csrfToken),
        );

        verifyNever(usersCsrfRetrieve);
      });

      test(
          'fetches, updates and returns csrfToken when lock '
          'has been acquired and csrfToken is null', () async {
        when(protect).thenAnswer((_) async => '');
        when(usersCsrfRetrieve).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            data: csrf,
          ),
        );

        final service = buildSubject();

        await service.fetchCsrfToken();

        final callback = verify(
          () => mutex.protect<String>(captureAny<Future<String> Function()>()),
        ).captured.single as Future<String> Function();

        await expectLater(
          callback(),
          completion(csrf.csrfToken),
        );

        expect(service.csrfToken, csrf.csrfToken);

        verify(usersCsrfRetrieve).called(1);
      });
    });

    group('clearToken', () {
      test('sets token to null', () {
        final service = buildSubject();
        service.csrfToken = 'csrfToken';
        service.clearToken();
        expect(service.csrfToken, null);
      });
    });
  });
}
