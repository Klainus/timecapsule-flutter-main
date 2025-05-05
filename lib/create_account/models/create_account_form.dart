import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_form.freezed.dart';

enum CreateAccountStatus {
  initial,
  invalid,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
}

@freezed
abstract class CreateAccountForm with _$CreateAccountForm {
  const factory CreateAccountForm({
    @Default(CreateAccountStatus.initial) CreateAccountStatus status,
    @Default(Email.empty) Email email,
    @Default(Password.empty) Password password,
  }) = _CreateAccountForm;

  const CreateAccountForm._();

  bool get isLoading => status.isLoading || status.isSuccess;

  String? emailErrorText(AppLocalizations l10n) => switch (status) {
        CreateAccountStatus.invalid => email.validationErrorText(l10n),
        CreateAccountStatus.failure => l10n.generalServerError,
        _ => null,
      };

  String? passwordErrorText(AppLocalizations l10n) => switch (status) {
        CreateAccountStatus.invalid => password.validationErrorText(l10n),
        CreateAccountStatus.failure => l10n.generalServerError,
        _ => null,
      };

  bool get isInvalid => email.isInvalid;
}
