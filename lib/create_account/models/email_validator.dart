import 'package:equatable/equatable.dart';

enum EmailValidationError { empty }

class EmailValidator extends Equatable {
  const EmailValidator();

  EmailValidationError? maybeError(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    return null;
  }

  @override
  List<Object?> get props => [];
}
