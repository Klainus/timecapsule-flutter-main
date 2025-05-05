// ignore_for_file: cascade_invocations
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockCsrfService extends Mock implements CsrfService {}

class _MockRetryService extends Mock implements RetryService {}

class _MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class _MockResponse extends Mock implements Response<dynamic> {}

void main() {
  const csrfToken = 'csrfToken';
  final headers = {'key': 'value'};

  final options = RequestOptions(
    headers: headers,
    baseUrl: 'https://example.com',
    path: '/endpoint',
  );

  group(CsrfInterceptor, () {
    late CsrfService csrfService;
    late RetryService retryService;
    late RequestInterceptorHandler requestHandler;
    late ResponseInterceptorHandler responseHandler;
    late Response<dynamic> response;

    setUp(() {
      csrfService = _MockCsrfService();
      retryService = _MockRetryService();
      requestHandler = _MockRequestInterceptorHandler();
      responseHandler = _MockResponseInterceptorHandler();
      response = _MockResponse();
      when(() => response.requestOptions).thenReturn(options);
      registerFallbackValue(RequestOptions());
      registerFallbackValue(
        DioException(
          requestOptions: RequestOptions(),
        ),
      );
    });

    CsrfInterceptor createSubject() {
      return CsrfInterceptor(
        csrfService: csrfService,
        retryService: retryService,
      );
    }

    group('onRequest', () {
      final isProtectedMethod = () => csrfService.isProtectedMethod(any());
      final fetchCsrfToken = () => csrfService.fetchCsrfToken();

      final nextWithSameOptions = () => requestHandler.next(options);

      final nextWithTokenHeader = () => requestHandler.next(
            any(
              that: isA<RequestOptions>().having(
                (options) => options.headers,
                'headers',
                {
                  ...headers,
                  ...CsrfService.headers(
                    uri: options.uri,
                    csrfToken: csrfToken,
                  ),
                },
              ),
            ),
          );

      test('calls next and returns when !isProtectedMethod', () async {
        when(isProtectedMethod).thenReturn(false);
        final interceptor = createSubject();
        await interceptor.onRequest(options, requestHandler);
        verify(isProtectedMethod).called(1);
        verify(nextWithSameOptions).called(1);
        verifyNever(fetchCsrfToken);
      });

      test(
          'calls next with updated headers '
          'when isProtectedMethod and csrfToken is not null', () async {
        when(isProtectedMethod).thenReturn(true);
        when(() => csrfService.csrfToken).thenReturn(csrfToken);
        final interceptor = createSubject();
        await interceptor.onRequest(options, requestHandler);
        verify(isProtectedMethod).called(1);
        verify(nextWithTokenHeader).called(1);
        verifyNever(fetchCsrfToken);
      });

      test(
          'calls fetchCsrfToken and next with updated headers '
          'when isProtectedMethod and csrfToken is null', () async {
        when(isProtectedMethod).thenReturn(true);
        when(() => csrfService.csrfToken).thenReturn(null);
        when(fetchCsrfToken).thenAnswer((_) async => csrfToken);
        final interceptor = createSubject();
        await interceptor.onRequest(options, requestHandler);
        verify(isProtectedMethod).called(1);
        verify(fetchCsrfToken).called(1);
        verify(nextWithTokenHeader).called(1);
      });

      test(
          'calls reject when fetchCsrfToken throws '
          'when isProtectedMethod and csrfToken is null', () async {
        final exception = Exception('oops');
        when(isProtectedMethod).thenReturn(true);
        when(() => csrfService.csrfToken).thenReturn(null);
        when(fetchCsrfToken).thenThrow(exception);
        final interceptor = createSubject();
        await interceptor.onRequest(options, requestHandler);
        verify(isProtectedMethod).called(1);
        verify(fetchCsrfToken).called(1);
        verifyNever(nextWithSameOptions);
        verify(
          () => requestHandler.reject(
            any(
              that: isA<DioException>()
                  .having(
                    (e) => e.requestOptions,
                    'requestOptions',
                    options,
                  )
                  .having(
                    (e) => e.error,
                    'error',
                    exception,
                  ),
            ),
          ),
        );
      });
    });

    group('onResponse', () {
      final retryResponse = _MockResponse();
      final isRetry = () => retryService.isRetry(any());
      final isProtectedMethod = () => csrfService.isProtectedMethod(any());
      final isTokenInvalid = () => csrfService.isTokenInvalid(any());
      final clearToken = () => csrfService.clearToken();
      final fetchCsrfToken = () => csrfService.fetchCsrfToken();

      final retry = () => retryService.retry(
            any(
              that: isA<RequestOptions>().having(
                (options) => options.headers,
                'headers',
                {
                  ...headers,
                  ...CsrfService.headers(
                    uri: options.uri,
                    csrfToken: csrfToken,
                  ),
                },
              ),
            ),
          );

      final nextWithSameResponse = () => responseHandler.next(response);
      final nextWithRetryResponse = () => responseHandler.next(retryResponse);

      test('calls next and returns when isRetry', () async {
        when(isRetry).thenReturn(true);
        final interceptor = createSubject();
        await interceptor.onResponse(response, responseHandler);
        verify(isRetry).called(1);
        verify(nextWithSameResponse).called(1);
        verifyNever(clearToken);
      });

      test('calls next and returns whe !isRetry and !isProtectedMethod',
          () async {
        when(isRetry).thenReturn(false);
        when(isProtectedMethod).thenReturn(false);
        final interceptor = createSubject();
        await interceptor.onResponse(response, responseHandler);
        verify(isRetry).called(1);
        verify(isProtectedMethod).called(1);
        verify(nextWithSameResponse).called(1);
        verifyNever(clearToken);
      });

      test(
          'calls next and returns when !isRetry and isProtectedMethod '
          'and !isTokenInvalid', () async {
        when(isRetry).thenReturn(false);
        when(isProtectedMethod).thenReturn(true);
        when(isTokenInvalid).thenReturn(false);
        final interceptor = createSubject();
        await interceptor.onResponse(response, responseHandler);
        verify(isRetry).called(1);
        verify(isProtectedMethod).called(1);
        verify(isTokenInvalid).called(1);
        verify(nextWithSameResponse).called(1);
        verifyNever(clearToken);
      });

      test(
          'calls clearToken, fetchCsrfToken, retry and next '
          'with retryResponse when !isRetry and isProtectedMethod '
          'and isTokenInvalid', () async {
        when(isRetry).thenReturn(false);
        when(isProtectedMethod).thenReturn(true);
        when(isTokenInvalid).thenReturn(true);
        when(fetchCsrfToken).thenAnswer((_) async => csrfToken);
        when(retry).thenAnswer((_) async => retryResponse);
        final interceptor = createSubject();
        await interceptor.onResponse(response, responseHandler);
        verify(isRetry).called(1);
        verify(isProtectedMethod).called(1);
        verify(isTokenInvalid).called(1);
        verify(clearToken).called(1);
        verify(fetchCsrfToken).called(1);
        verify(retry).called(1);
        verify(nextWithRetryResponse).called(1);
      });

      test(
          'calls clearToken and reject when fetchCsrfToken throws '
          'when !isRetry and isProtectedMethod and isTokenInvalid', () async {
        final exception = Exception('oops');
        when(isRetry).thenReturn(false);
        when(isProtectedMethod).thenReturn(true);
        when(isTokenInvalid).thenReturn(true);
        when(fetchCsrfToken).thenThrow(exception);
        final interceptor = createSubject();
        await interceptor.onResponse(response, responseHandler);
        verify(isRetry).called(1);
        verify(isProtectedMethod).called(1);
        verify(isTokenInvalid).called(1);
        verify(clearToken).called(1);
        verify(fetchCsrfToken).called(1);
        verifyNever(nextWithSameResponse);
        verify(
          () => responseHandler.reject(
            any(
              that: isA<DioException>()
                  .having(
                    (e) => e.requestOptions,
                    'requestOptions',
                    options,
                  )
                  .having(
                    (e) => e.error,
                    'error',
                    exception,
                  ),
            ),
          ),
        );
      });

      test(
          'calls clearToken, fetchCsrfToken and reject when retry throws '
          'when !isRetry and isProtectedMethod and isTokenInvalid', () async {
        final exception = Exception('oops');
        when(isRetry).thenReturn(false);
        when(isProtectedMethod).thenReturn(true);
        when(isTokenInvalid).thenReturn(true);
        when(fetchCsrfToken).thenAnswer((_) async => csrfToken);
        when(retry).thenThrow(exception);
        final interceptor = createSubject();
        await interceptor.onResponse(response, responseHandler);
        verify(isRetry).called(1);
        verify(isProtectedMethod).called(1);
        verify(isTokenInvalid).called(1);
        verify(clearToken).called(1);
        verify(fetchCsrfToken).called(1);
        verify(retry).called(1);
        verifyNever(nextWithSameResponse);
        verify(
          () => responseHandler.reject(
            any(
              that: isA<DioException>()
                  .having(
                    (e) => e.requestOptions,
                    'requestOptions',
                    options,
                  )
                  .having(
                    (e) => e.error,
                    'error',
                    exception,
                  ),
            ),
          ),
        );
      });
    });
  });
}
