import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form.freezed.dart';

enum LoginFormStatus {
  initial,
  invalid,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
}

@freezed
abstract class LoginForm with _$LoginForm {
  const factory LoginForm({
    @Default(LoginFormStatus.initial) LoginFormStatus status,
    @Default(Email.empty) Email email,
    @Default(Password.empty) Password password,
    LoginFailure? failure,
  }) = _LoginForm;

  const LoginForm._();

  bool get isLoading => status.isLoading || status.isSuccess;

  String? emailErrorText(AppLocalizations l10n) => switch (status) {
        LoginFormStatus.invalid => email.validationErrorText(l10n),
        LoginFormStatus.failure => failure.serverErrorText(l10n),
        _ => null,
      };

  String? passwordErrorText(AppLocalizations l10n) => switch (status) {
        LoginFormStatus.invalid => password.validationErrorText(l10n),
        LoginFormStatus.failure => failure.serverErrorText(l10n),
        _ => null,
      };

  bool get isInvalid => email.isInvalid || password.isInvalid;
}
