import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

class AppSettingsException with EquatableMixin implements Exception {
  const AppSettingsException(this.error);

  final Object? error;

  @override
  List<Object?> get props => [error];
}

class AppSettingsFailure with EquatableMixin implements Exception {
  const AppSettingsFailure();

  @override
  List<Object?> get props => [];
}

class AppSettingsService {
  const AppSettingsService();

  Future<void> open() async {
    bool didOpen;

    try {
      didOpen = await permission_handler.openAppSettings();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        AppSettingsException(error),
        stackTrace,
      );
    }

    if (!didOpen) throw const AppSettingsFailure();
  }
}
