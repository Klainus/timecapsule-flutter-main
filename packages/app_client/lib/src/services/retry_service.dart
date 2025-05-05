import 'package:app_client/app_client.dart';

class RetryService {
  RetryService({required Dio client}) : _client = client;

  final Dio _client;

  Future<Response<dynamic>> retry(RequestOptions options) async {
    final response = await _client.fetch<dynamic>(
      options.copyWith(
        extra: {
          ...options.extra,
          'is_retry': true,
        },
      ),
    );
    return response;
  }

  bool isRetry(RequestOptions options) => options.extra['is_retry'] == true;
}
