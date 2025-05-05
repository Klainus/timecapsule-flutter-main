import 'package:equatable/equatable.dart';

enum PasswordValidationError { empty }

class PasswordValidator extends Equatable {
  const PasswordValidator();

  PasswordValidationError? maybeError(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    return null;
  }

  @override
  List<Object?> get props => [];
}
