import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authenticationRepository) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith.form.email(
        value: event.value,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith.form.password(
        value: event.value,
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.form.isInvalid) {
      return emit(
        state.copyWith.form(
          status: LoginFormStatus.invalid,
        ),
      );
    }

    emit(
      state.copyWith.form(
        status: LoginFormStatus.loading,
      ),
    );

    try {
      await _authenticationRepository.login(
        email: state.form.email.value,
        password: state.form.password.value,
      );

      emit(
        state.copyWith.form(
          status: LoginFormStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith.form(
          status: LoginFormStatus.failure,
          failure: e is LoginFailure ? e : null,
        ),
      );
    }
  }
}
