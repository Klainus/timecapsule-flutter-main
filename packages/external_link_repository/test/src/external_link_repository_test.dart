// ignore_for_file: prefer_const_constructors

import 'package:external_link_repository/external_link_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppSettingsService extends Mock implements AppSettingsService {}

class MockExternalLinkService extends Mock implements ExternalLinkService {}

void main() {
  group('ExternalLinkRepository', () {
    late AppSettingsService appSettingsService;
    late ExternalLinkService externalLinkService;

    setUp(() {
      appSettingsService = MockAppSettingsService();
      externalLinkService = MockExternalLinkService();
    });

    ExternalLinkRepository createSubject() {
      return ExternalLinkRepository(
        externalLinkService,
        appSettingsService,
      );
    }

    group('openAppSettings', () {
      test('calls AppSettingsService.open', () async {
        when(() => appSettingsService.open()).thenAnswer(
          (_) async {},
        );
        final repository = createSubject();
        await repository.openAppSettings();
        verify(() => appSettingsService.open()).called(1);
      });
    });

    group('launchTermsLink', () {
      test('calls ExternalLinkService.launch with termsLink', () async {
        when(() => externalLinkService.launch(termsLink)).thenAnswer(
          (_) async {},
        );
        final repository = createSubject();
        await repository.launchTermsLink();
        verify(() => externalLinkService.launch(termsLink)).called(1);
      });
    });

    group('launchDataManagementLink', () {
      test('calls ExternalLinkService.launch with dataHandlingLink', () async {
        when(() => externalLinkService.launch(dataHandlingLink)).thenAnswer(
          (_) async {},
        );
        final repository = createSubject();
        await repository.launchDataHandlingLink();
        verify(() => externalLinkService.launch(dataHandlingLink)).called(1);
      });
    });
  });
}
