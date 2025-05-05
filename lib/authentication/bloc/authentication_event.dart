part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class AuthenticationStatusSubscriptionRequested
    extends AuthenticationEvent {
  const AuthenticationStatusSubscriptionRequested();
}

final class AuthenticationUserSubscriptionRequested
    extends AuthenticationEvent {
  const AuthenticationUserSubscriptionRequested();
}

final class AuthenticationLogoutPressed extends AuthenticationEvent
    with EquatableMixin {
  const AuthenticationLogoutPressed();

  @override
  List<Object> get props => [];
}
