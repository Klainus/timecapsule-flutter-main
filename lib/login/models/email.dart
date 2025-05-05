import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email.freezed.dart';

@freezed
abstract class Email with _$Email {
  const factory Email({
    required EmailValidator validator,
    required EmailErrorTranslator translator,
    required String value,
  }) = _Email;

  const Email._();

  EmailValidationError? get _error => validator.maybeError(value);

  bool get isInvalid => _error != null;

  String? validationErrorText(AppLocalizations l10n) {
    final error = _error;
    if (error == null) return null;
    return translator.errorText(error, l10n);
  }

  static const empty = Email(
    validator: EmailValidator(),
    translator: EmailErrorTranslator(),
    value: '',
  );
}
