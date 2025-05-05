import 'package:app_client_platform_configuration/src/platform_configuration/stub_configuration.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCookieJar extends Mock implements CookieJar {}

void main() {
  group('addPlatformConfiguration', () {
    late Dio dio;
    late CookieJar cookieJar;

    setUp(() {
      dio = Dio();
      cookieJar = MockCookieJar();
    });

    test('throws $UnimplementedError', () {
      expect(
        () => addPlatformConfiguration(dio, cookieJar),
        throwsUnimplementedError,
      );
    });
  });
}
