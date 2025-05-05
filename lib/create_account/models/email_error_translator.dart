import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:equatable/equatable.dart';

class EmailErrorTranslator extends Equatable {
  const EmailErrorTranslator();

  String errorText(
    EmailValidationError error,
    AppLocalizations l10n,
  ) {
    return switch (error) {
      EmailValidationError.empty => l10n.emailEmpty,
    };
  }

  @override
  List<Object?> get props => [];
}
