// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group(RetryService, () {
    late Dio client;

    setUp(() {
      client = MockDio();
      registerFallbackValue(RequestOptions());
    });

    RetryService buildSubject() {
      return RetryService(client: client);
    }

    group('retry', () {
      final extra = {'key': 'value'};
      final options = RequestOptions(extra: extra);

      final fetch = () => client.fetch<dynamic>(
            any(
              that: isA<RequestOptions>().having(
                (options) => options.extra,
                'extra',
                {
                  ...extra,
                  'is_retry': true,
                },
              ),
            ),
          );

      test('calls fetch with is_retry = true and returns response', () async {
        when(fetch).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
          ),
        );
        final service = buildSubject();
        expect(
          service.retry(options),
          completion(
            isA<Response<dynamic>>(),
          ),
        );
        verify(fetch).called(1);
      });
    });

    group('isRetry', () {
      test('returns true when is_retry is true', () {
        final options = RequestOptions(
          extra: {'is_retry': true},
        );
        final service = buildSubject();
        expect(service.isRetry(options), true);
      });

      test('returns false when is_retry is false', () {
        final options = RequestOptions(
          extra: {'is_retry': false},
        );
        final service = buildSubject();
        expect(service.isRetry(options), false);
      });

      test('returns false when is_retry is null', () {
        final options = RequestOptions();
        final service = buildSubject();
        expect(service.isRetry(options), false);
      });
    });
  });
}
