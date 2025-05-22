import 'dart:async';

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:external_link_repository/external_link_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_account_event.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc(
    this._authenticationRepository,
    this._externalLinkRepository,
  ) : super(const CreateAccountState()) {
    on<CreateAccountEmailChanged>(_onEmailChanged);
    on<CreateAccountPasswordChanged>(_onPasswordChanged);
    on<CreateAccountSubmitted>(_onSubmitted);
    on<CreateAccountTermsLinkPressed>(_onTermsLinkPressed);
    on<CreateAccountDataHandlingLinkPressed>(_onDataHandlingLinkPressed);
    on<CreateAccountShowIntroChanged>(_changeIntroStatus);
  }

  final AuthenticationRepository _authenticationRepository;
  final ExternalLinkRepository _externalLinkRepository;

  void _onEmailChanged(
    CreateAccountEmailChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith.form.email(
        value: event.value,
      ),
    );
  }

  void _changeIntroStatus(
    CreateAccountShowIntroChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith(showIntro: false),
    );
  }

  void _onPasswordChanged(
    CreateAccountPasswordChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(
      state.copyWith.form.password(
        value: event.value,
      ),
    );
  }

  Future<void> _onSubmitted(
    CreateAccountSubmitted event,
    Emitter<CreateAccountState> emit,
  ) async {
    if (state.form.isInvalid) {
      return emit(
        state.copyWith.form(
          status: CreateAccountStatus.invalid,
        ),
      );
    }

    emit(
      state.copyWith.form(
        status: CreateAccountStatus.loading,
      ),
    );

    try {
      await _authenticationRepository.register(
        email: state.form.email.value,
        password: state.form.password.value,
      );

      emit(
        state.copyWith(
          form: state.form.copyWith(
            status: CreateAccountStatus.success,
          ),
          showIntro: true,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith.form(
          status: CreateAccountStatus.failure,
        ),
      );
    }
  }

  void _onTermsLinkPressed(
    CreateAccountTermsLinkPressed event,
    Emitter<CreateAccountState> emit,
  ) {
    _externalLinkRepository.launchTermsLink();
  }

  void _onDataHandlingLinkPressed(
    CreateAccountDataHandlingLinkPressed event,
    Emitter<CreateAccountState> emit,
  ) {
    _externalLinkRepository.launchDataHandlingLink();
  }
}
