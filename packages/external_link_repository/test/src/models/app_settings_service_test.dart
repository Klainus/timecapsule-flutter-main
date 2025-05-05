// ignore_for_file: prefer_const_constructors

import 'package:external_link_repository/external_link_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPermissionHandlerPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements PermissionHandlerPlatform {}

void main() {
  group('AppSettingsService', () {
    late MockPermissionHandlerPlatform mock;

    setUp(() {
      mock = MockPermissionHandlerPlatform();
      PermissionHandlerPlatform.instance = mock;
    });

    AppSettingsService createSubject() => AppSettingsService();

    group('open', () {
      test('completes when openAppSettings returns true', () {
        when(() => mock.openAppSettings()).thenAnswer(
          (_) async => true,
        );
        final service = createSubject();

        expect(
          service.open(),
          completes,
        );

        verify(() => mock.openAppSettings()).called(1);
      });

      test('throws AppSettingsException when openAppSettings throws', () {
        final exception = Exception('oops');

        when(() => mock.openAppSettings()).thenThrow(exception);
        final service = createSubject();

        expect(
          service.open(),
          throwsA(
            AppSettingsException(exception),
          ),
        );

        verify(() => mock.openAppSettings()).called(1);
      });

      test('throws AppSettingsFailure when openAppSettings returns false', () {
        when(() => mock.openAppSettings()).thenAnswer(
          (_) async => false,
        );
        final service = createSubject();

        expect(
          service.open(),
          throwsA(
            AppSettingsFailure(),
          ),
        );

        verify(() => mock.openAppSettings()).called(1);
      });
    });
  });
}
