import 'package:app_client/app_client.dart';

class CsrfInterceptor extends Interceptor {
  CsrfInterceptor({
    required CsrfService csrfService,
    required RetryService retryService,
  })  : _csrfService = csrfService,
        _retryService = retryService;

  final CsrfService _csrfService;
  final RetryService _retryService;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isProtectedMethod = _csrfService.isProtectedMethod(options.method);
    if (!isProtectedMethod) return super.onRequest(options, handler);

    var csrfToken = _csrfService.csrfToken;

    if (csrfToken == null) {
      try {
        csrfToken = await _csrfService.fetchCsrfToken();
      } catch (error, stackTrace) {
        return handler.reject(
          DioException(
            requestOptions: options,
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    }

    options.headers = {
      ...options.headers,
      ...CsrfService.headers(
        uri: options.uri,
        csrfToken: csrfToken,
      ),
    };

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    final Response(:statusCode, requestOptions: options) = response;

    final isRetry = _retryService.isRetry(options);
    if (isRetry) return super.onResponse(response, handler);

    final isProtectedMethod = _csrfService.isProtectedMethod(options.method);
    if (!isProtectedMethod) return super.onResponse(response, handler);

    final isTokenInvalid = _csrfService.isTokenInvalid(statusCode);
    if (!isTokenInvalid) return super.onResponse(response, handler);

    _csrfService.clearToken();

    try {
      final csrfToken = await _csrfService.fetchCsrfToken();

      options.headers = {
        ...options.headers,
        ...CsrfService.headers(
          uri: options.uri,
          csrfToken: csrfToken,
        ),
      };

      final retryResponse = await _retryService.retry(options);
      super.onResponse(retryResponse, handler);
    } catch (error, stackTrace) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: error,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
