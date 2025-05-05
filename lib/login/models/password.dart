import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password.freezed.dart';

@freezed
abstract class Password with _$Password {
  const factory Password({
    required PasswordValidator validator,
    required PasswordErrorTranslator translator,
    required String value,
  }) = _Password;

  const Password._();

  PasswordValidationError? get _error => validator.maybeError(value);

  bool get isInvalid => _error != null;

  String? validationErrorText(AppLocalizations l10n) {
    final error = _error;
    if (error == null) return null;
    return translator.errorText(error, l10n);
  }

  static const empty = Password(
    validator: PasswordValidator(),
    translator: PasswordErrorTranslator(),
    value: '',
  );
}
