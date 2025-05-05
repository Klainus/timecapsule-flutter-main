// ignore_for_file: cascade_invocations
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

void main() {
  group(LogoutInterceptor, () {
    late AppClient client;
    late ResponseInterceptorHandler handler;

    setUp(() {
      client = _MockAppClient();
      handler = _MockResponseInterceptorHandler();
    });

    LogoutInterceptor createSubject() {
      return LogoutInterceptor(client: client);
    }

    group('onResponse', () {
      final unauthenticate = () => client.unauthenticate();
      final requestOptions = RequestOptions();

      test(
          'calls unauthenticate when statusCode is 403 '
          'and currentStatus is ${AuthenticationStatus.authenticated} '
          'and calls next', () {
        when(() => client.currentStatus).thenReturn(
          AuthenticationStatus.authenticated,
        );
        final response = Response<void>(
          requestOptions: requestOptions,
          statusCode: 403,
        );
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(unauthenticate);
        verify(() => handler.next(response));
      });

      test(
          'does not call unauthenticate when statusCode is not 403 '
          'and calls next', () {
        final response = Response<void>(
          requestOptions: requestOptions,
          statusCode: 200,
        );
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verifyNever(unauthenticate);
        verify(() => handler.next(response));
      });

      test(
          'does not call unauthenticate when statusCode is 403 '
          'and currentStatus is not ${AuthenticationStatus.authenticated} '
          'and calls next', () {
        when(() => client.currentStatus).thenReturn(
          AuthenticationStatus.unauthenticated,
        );
        final response = Response<void>(
          requestOptions: requestOptions,
          statusCode: 403,
        );
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verifyNever(unauthenticate);
        verify(() => handler.next(response));
      });
    });
  });
}
