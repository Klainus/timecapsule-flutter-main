import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:equatable/equatable.dart';

class PasswordErrorTranslator extends Equatable {
  const PasswordErrorTranslator();

  String errorText(
    PasswordValidationError error,
    AppLocalizations l10n,
  ) {
    return switch (error) {
      PasswordValidationError.empty => l10n.passwordEmpty,
    };
  }

  @override
  List<Object?> get props => [];
}
