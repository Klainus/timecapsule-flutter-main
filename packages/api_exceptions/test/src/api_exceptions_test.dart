// ignore_for_file: prefer_const_constructors
import 'package:api_exceptions/api_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HttpException', () {
    test('toString returns normally', () {
      expect(
        HttpException('error').toString,
        returnsNormally,
      );
    });
  });

  group('HttpRequestFailure', () {
    test('toString returns normally', () {
      expect(
        HttpRequestFailure(
          400,
          {'body': 'body'},
        ).toString,
        returnsNormally,
      );
    });
  });

  group('JsonDeserializationException', () {
    test('toString returns normally', () {
      expect(
        JsonDeserializationException(
          Exception('oops'),
          {'body': 'body'},
        ).toString,
        returnsNormally,
      );
    });
  });
}
