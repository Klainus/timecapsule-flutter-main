part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginEmailChanged extends LoginEvent with Analytic {
  const LoginEmailChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

final class LoginSubmitted extends LoginEvent with Analytic {
  const LoginSubmitted();
}

final class LoginPasswordChanged extends LoginEvent with Analytic {
  const LoginPasswordChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}
