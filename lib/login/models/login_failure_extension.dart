import 'package:app_l10n/app_l10n.dart';
import 'package:authentication_repository/authentication_repository.dart';

extension LoginFailureExtension on LoginFailure? {
  String? serverErrorText(AppLocalizations l10n) {
    return switch (this) {
      InvalidCredentials() => l10n.invalidCredentials,
      EmailUnverified() => l10n.emailUnverified,
      null => l10n.generalServerError,
    };
  }
}
