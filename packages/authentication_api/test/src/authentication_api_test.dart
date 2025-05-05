// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:authentication_api/authentication_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockUsersApi extends Mock implements UsersApi {}

void main() {
  group(AuthenticationApi, () {
    late AppClient client;
    late UsersApi usersApi;

    setUp(() {
      client = _MockAppClient();
      usersApi = _MockUsersApi();
    });

    AuthenticationApi createSubject() {
      return AuthenticationApi(
        appClient: client,
        usersApi: usersApi,
      );
    }

    group('status', () {
      test('returns client.authenticationStatus', () {
        const stream = Stream<AuthenticationStatus>.empty();
        when(() => client.authenticationStatus).thenAnswer((_) => stream);
        final api = createSubject();
        expect(api.status, stream);
      });
    });

    group('currentStatus', () {
      test('returns client.currentStatus', () {
        const status = AuthenticationStatus.authenticated;
        when(() => client.currentStatus).thenReturn(status);
        final api = createSubject();
        expect(api.currentStatus, status);
      });
    });

    group('authenticate', () {
      final authenticate = () => client.authenticate();

      test('calls client.authenticate', () {
        final api = createSubject();
        api.authenticate();
        verify(authenticate).called(1);
      });
    });

    group('login', () {
      const email = 'email';
      const password = 'password';

      final request = () => usersApi.usersLoginCreate(
            login: Login(
              email: email,
              password: password,
            ),
          );

      final authenticate = () => client.authenticate();

      test('calls authenticate when request succeeds', () async {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: Login(
              email: email,
              password: password,
            ),
          ),
        );
        final api = createSubject();
        await api.login(
          email: email,
          password: password,
        );
        verify(authenticate).called(1);
        verify(request).called(1);
      });

      test(
          'throws $LoginInvalidCredentialsExeption when status code is 401 '
          'and detail matches the expected pattern', () {
        when(request).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 401,
              data: {
                'detail': 'No active account found with the given credentials',
              },
            ),
          ),
        );
        final api = createSubject();
        expect(
          api.login(
            email: email,
            password: password,
          ),
          throwsA(
            isA<LoginInvalidCredentialsExeption>(),
          ),
        );
        verify(request).called(1);
      });

      test(
          'throws $EmailUnverifiedException when status code is 403 '
          'and detail matches expected pattern', () {
        when(request).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 403,
              data: {
                'detail': 'Email is not verified',
              },
            ),
          ),
        );
        final api = createSubject();
        expect(
          api.login(
            email: email,
            password: password,
          ),
          throwsA(
            isA<EmailUnverifiedException>(),
          ),
        );
        verify(request).called(1);
      });

      test(
          'throws $HttpException when request throws $DioException '
          'that does not match any pattern', () {
        when(request).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 401,
              data: {'detail': 'oops'},
            ),
          ),
        );
        final api = createSubject();
        expect(
          () => api.login(
            email: email,
            password: password,
          ),
          throwsA(isA<HttpException>()),
        );
        verify(request).called(1);
      });

      test('throws $HttpException when request throws unknown error', () {
        when(request).thenThrow(Exception('oops'));
        final api = createSubject();
        expect(
          () => api.login(
            email: email,
            password: password,
          ),
          throwsA(isA<HttpException>()),
        );
        verify(request).called(1);
      });

      test('throws $HttpRequestFailure when status code is not 200', () {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 201,
            data: Login(
              email: email,
              password: password,
            ),
          ),
        );
        final api = createSubject();
        expect(
          api.login(
            email: email,
            password: password,
          ),
          throwsA(
            isA<HttpRequestFailure>(),
          ),
        );
        verify(request).called(1);
      });
    });

    group('register', () {
      const email = 'email';
      const password = 'password';

      final request = () => usersApi.usersRegisterCreate(
            registration: Registration(
              email: email,
              password: password,
            ),
          );

      test('completes when request succeeds', () async {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 201,
            data: Registration(
              email: email,
              password: password,
            ),
          ),
        );
        final api = createSubject();
        await api.register(
          email: email,
          password: password,
        );
        verify(request).called(1);
      });

      test('throws $RegisterValidationException when status code is 400', () {
        when(request).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 400,
            ),
          ),
        );
        final api = createSubject();
        expect(
          api.register(
            email: email,
            password: password,
          ),
          throwsA(
            isA<RegisterValidationException>(),
          ),
        );
        verify(request).called(1);
      });

      test(
          'throws $HttpException when request throws $DioException '
          'that does not match any pattern', () {
        when(request).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 401,
              data: {'detail': 'oops'},
            ),
          ),
        );
        final api = createSubject();
        expect(
          () => api.register(
            email: email,
            password: password,
          ),
          throwsA(isA<HttpException>()),
        );
        verify(request).called(1);
      });

      test('throws $HttpException when request throws unknown error', () {
        when(request).thenThrow(Exception('oops'));
        final api = createSubject();
        expect(
          () => api.register(
            email: email,
            password: password,
          ),
          throwsA(isA<HttpException>()),
        );
        verify(request).called(1);
      });

      test('throws $HttpRequestFailure when status code is not 201', () {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: Registration(
              email: email,
              password: password,
            ),
          ),
        );
        final api = createSubject();
        expect(
          api.register(
            email: email,
            password: password,
          ),
          throwsA(
            isA<HttpRequestFailure>(),
          ),
        );
        verify(request).called(1);
      });
    });

    group('resetPassword', () {
      const email = 'email';

      final request = () => usersApi.usersResetPasswordCreate(
            resetPassword: ResetPassword(email: email),
          );

      test('completes when request succeeds', () async {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 204,
            data: ResetPassword(email: email),
          ),
        );
        final api = createSubject();
        await api.resetPassword(
          email: email,
        );
        verify(request).called(1);
      });

      test('throws $HttpException when request throws', () {
        when(request).thenThrow(Exception('oops'));
        final api = createSubject();
        expect(
          () => api.resetPassword(email: email),
          throwsA(
            isA<HttpException>(),
          ),
        );
        verify(request).called(1);
      });

      test('throws $HttpRequestFailure when status code is not 204', () {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: ResetPassword(email: email),
          ),
        );
        final api = createSubject();
        expect(
          api.resetPassword(email: email),
          throwsA(
            isA<HttpRequestFailure>(),
          ),
        );
        verify(request).called(1);
      });
    });

    group('deleteUser', () {
      const password = 'password';
      final request = () => usersApi.usersMeDestroy();
      final unauthenticate = () => client.unauthenticate();

      test('calls unauthenticate when request succeeds', () async {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 204,
          ),
        );
        final api = createSubject();
        await api.deleteUser(password);
        verify(request).called(1);
        verify(unauthenticate).called(1);
      });

      test('throws $HttpException when request throws', () {
        when(request).thenThrow(Exception('oops'));
        final api = createSubject();
        expect(
          () => api.deleteUser(password),
          throwsA(
            isA<HttpException>(),
          ),
        );
        verify(request).called(1);
      });

      test('throws $HttpRequestFailure when status code is not 204', () {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
          ),
        );
        final api = createSubject();
        expect(
          api.deleteUser(password),
          throwsA(
            isA<HttpRequestFailure>(),
          ),
        );
        verify(request).called(1);
      });
    });

    group('unauthenticate', () {
      final usersLogoutCreate = () => usersApi.usersLogoutCreate();
      final unauthenticate = () => client.unauthenticate();

      test('calls usersLogoutCreate and client.unauthenticate', () async {
        when(usersLogoutCreate).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
          ),
        );
        final api = createSubject();
        await api.unauthenticate();
        verify(usersLogoutCreate).called(1);
        verify(unauthenticate).called(1);
      });
    });
  });
}
