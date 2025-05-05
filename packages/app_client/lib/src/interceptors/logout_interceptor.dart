import 'package:app_client/app_client.dart';

class LogoutInterceptor extends Interceptor {
  LogoutInterceptor({
    required AppClient client,
  }) : _client = client;

  final AppClient _client;

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == 403 &&
        _client.currentStatus == AuthenticationStatus.authenticated) {
      _client.unauthenticate();
    }

    super.onResponse(response, handler);
  }
}
