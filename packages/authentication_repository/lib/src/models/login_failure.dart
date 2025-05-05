import 'package:equatable/equatable.dart';

sealed class LoginFailure with EquatableMixin implements Exception {
  const LoginFailure(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

final class InvalidCredentials extends LoginFailure {
  const InvalidCredentials(super.error);
}

final class EmailUnverified extends LoginFailure {
  const EmailUnverified(super.error);
}
