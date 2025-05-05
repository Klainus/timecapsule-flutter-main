import 'package:app_api/app_api.dart';
import 'package:meta/meta.dart';
import 'package:mutex/mutex.dart';

class CsrfService {
  CsrfService({
    required UsersApi usersApi,
    required Mutex mutex,
  })  : _usersApi = usersApi,
        _mutex = mutex;

  static Map<String, dynamic> headers({
    required Uri uri,
    required String csrfToken,
  }) {
    return {
      'Origin': uri.origin,
      'X-CSRFToken': csrfToken,
    };
  }

  final UsersApi _usersApi;
  final Mutex _mutex;

  String? _csrfToken;

  String? get csrfToken => _csrfToken;

  @visibleForTesting
  set csrfToken(String? value) {
    _csrfToken = value;
  }

  bool isProtectedMethod(String method) =>
      ['POST', 'PUT', 'DELETE', 'PATCH'].contains(method);

  bool isTokenInvalid(int? statusCode) => statusCode == 403;

  Future<String> fetchCsrfToken() async {
    return _mutex.protect(() async {
      final token = csrfToken;
      if (token != null) return token;

      final response = await _usersApi.usersCsrfRetrieve();
      final fetchedToken = response.data!.csrfToken;

      csrfToken = fetchedToken;
      return fetchedToken;
    });
  }

  void clearToken() {
    csrfToken = null;
  }
}
