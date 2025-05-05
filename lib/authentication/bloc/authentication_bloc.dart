import 'dart:async';

import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required UserRepository userRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(
          AuthenticationState(
            status: authenticationRepository.currentStatus,
            user: userRepository.currentUser,
          ),
        ) {
    on<AuthenticationStatusSubscriptionRequested>(
      _onStatusSubscriptionRequested,
    );
    on<AuthenticationUserSubscriptionRequested>(
      _onUserSubscriptionRequested,
    );
    on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Future<void> _onStatusSubscriptionRequested(
    AuthenticationStatusSubscriptionRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit.forEach(
      _authenticationRepository.status,
      onData: (status) => state.copyWith(status: status),
    );
  }

  Future<void> _onUserSubscriptionRequested(
    AuthenticationUserSubscriptionRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit.forEach(
      _userRepository.user,
      onData: (user) => state.copyWith(user: user),
    );
  }

  void _onLogoutPressed(
    AuthenticationLogoutPressed event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logout();
  }
}
