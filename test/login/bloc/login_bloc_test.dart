// ignore_for_file: prefer_const_constructors

import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  final email = Email(
    validator: EmailValidator(),
    translator: EmailErrorTranslator(),
    value: 'email',
  );

  final password = Password(
    validator: PasswordValidator(),
    translator: PasswordErrorTranslator(),
    value: 'password',
  );

  group('LoginBloc', () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
    });

    LoginBloc buildBloc() => LoginBloc(authenticationRepository);

    test('initial state is LoginState', () {
      expect(buildBloc().state, LoginState());
    });

    group('LoginEmailChanged', () {
      blocTest<LoginBloc, LoginState>(
        'emits email',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            LoginEmailChanged(email.value),
          );
        },
        expect: () => [
          LoginState(
            form: LoginForm(
              email: email,
            ),
          ),
        ],
      );
    });

    group('LoginPasswordChanged', () {
      blocTest<LoginBloc, LoginState>(
        'emits password',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            LoginPasswordChanged(password.value),
          );
        },
        expect: () => [
          LoginState(
            form: LoginForm(
              password: password,
            ),
          ),
        ],
      );
    });

    group('LoginSubmitted', () {
      blocTest<LoginBloc, LoginState>(
        'emits [invalid] when emailForm is invalid',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            const LoginSubmitted(),
          );
        },
        expect: () => [
          LoginState(
            form: LoginForm(
              status: LoginFormStatus.invalid,
            ),
          ),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'emits [loading, success] '
        'when authenticationRepository.logIn succeeds',
        setUp: () {
          when(
            () => authenticationRepository.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenAnswer((_) async {});
        },
        seed: () => LoginState(
          form: LoginForm(
            email: email,
            password: password,
          ),
        ),
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            const LoginSubmitted(),
          );
        },
        expect: () => [
          LoginState(
            form: LoginForm(
              status: LoginFormStatus.loading,
              email: email,
              password: password,
            ),
          ),
          LoginState(
            form: LoginForm(
              status: LoginFormStatus.success,
              email: email,
              password: password,
            ),
          ),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'emits [loading, failure] '
        'when authenticationRepository.logIn fails',
        setUp: () {
          when(
            () => authenticationRepository.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(InvalidCredentials('oops'));
        },
        seed: () => LoginState(
          form: LoginForm(
            email: email,
            password: password,
          ),
        ),
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            const LoginSubmitted(),
          );
        },
        expect: () => [
          LoginState(
            form: LoginForm(
              status: LoginFormStatus.loading,
              email: email,
              password: password,
            ),
          ),
          LoginState(
            form: LoginForm(
              status: LoginFormStatus.failure,
              email: email,
              password: password,
              failure: InvalidCredentials('oops'),
            ),
          ),
        ],
      );
    });
  });
}
