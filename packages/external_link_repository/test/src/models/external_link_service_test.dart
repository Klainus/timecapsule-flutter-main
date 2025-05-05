// ignore_for_file: prefer_const_constructors

import 'package:external_link_repository/external_link_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class MockUrlLauncherPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {}

void main() {
  group('ExternalLinkService', () {
    late MockUrlLauncherPlatform mock;

    setUp(() {
      mock = MockUrlLauncherPlatform();
      UrlLauncherPlatform.instance = mock;
      registerFallbackValue(const LaunchOptions());
    });

    const urlString = 'https:urlString';

    ExternalLinkService createSubject() => ExternalLinkService();

    group('launch', () {
      test('completes when launchUrl returns true', () {
        when(() => mock.launchUrl(urlString, any())).thenAnswer(
          (_) async => true,
        );
        final service = createSubject();

        expect(
          service.launch(urlString),
          completes,
        );

        verify(() => mock.launchUrl(urlString, any())).called(1);
      });

      test('adds https: when urlString does not have :https or :http', () {
        when(() => mock.launchUrl('https:url', any())).thenAnswer(
          (_) async => true,
        );
        final service = createSubject();

        expect(
          service.launch('url'),
          completes,
        );

        verify(() => mock.launchUrl('https:url', any())).called(1);
      });

      test('does not add https: when urlString has :https', () {
        const urlWithHttps = 'https:url';
        when(() => mock.launchUrl(urlWithHttps, any())).thenAnswer(
          (_) async => true,
        );
        final service = createSubject();

        expect(
          service.launch(urlWithHttps),
          completes,
        );

        verify(() => mock.launchUrl(urlWithHttps, any())).called(1);
      });

      test('does not add https: when urlString has :http', () {
        const urlWithHttp = 'http:url';
        when(() => mock.launchUrl(urlWithHttp, any())).thenAnswer(
          (_) async => true,
        );
        final service = createSubject();

        expect(
          service.launch(urlWithHttp),
          completes,
        );

        verify(() => mock.launchUrl(urlWithHttp, any())).called(1);
      });

      test('throws ExternalLinkException when launchUrl throws', () {
        final exception = Exception('oops');

        when(() => mock.launchUrl(urlString, any())).thenThrow(exception);
        final service = createSubject();

        expect(
          service.launch(urlString),
          throwsA(
            ExternalLinkException(exception),
          ),
        );

        verify(() => mock.launchUrl(urlString, any())).called(1);
      });

      test('throws ExternalLinkFailure when launchUrl returns false', () {
        when(() => mock.launchUrl(urlString, any())).thenAnswer(
          (_) async => false,
        );
        final service = createSubject();

        expect(
          service.launch(urlString),
          throwsA(
            ExternalLinkFailure(urlString),
          ),
        );

        verify(() => mock.launchUrl(urlString, any())).called(1);
      });
    });
  });
}
