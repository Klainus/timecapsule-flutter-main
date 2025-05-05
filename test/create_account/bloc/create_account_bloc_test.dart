// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_redundant_argument_values

import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:external_link_repository/external_link_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockExternalLinkRepository extends Mock
    implements ExternalLinkRepository {}

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

  group('CreateAccountBloc', () {
    late AuthenticationRepository authenticationRepository;
    late ExternalLinkRepository externalLinkRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      externalLinkRepository = MockExternalLinkRepository();
    });

    CreateAccountBloc buildBloc() {
      return CreateAccountBloc(
        authenticationRepository,
        externalLinkRepository,
      );
    }

    test('initial state is CreateAccountState', () {
      expect(buildBloc().state, CreateAccountState());
    });

    group('CreateAccountEmailChanged', () {
      blocTest<CreateAccountBloc, CreateAccountState>(
        'emits email',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountEmailChanged(email.value),
          );
        },
        expect: () => [
          CreateAccountState(
            form: CreateAccountForm(
              email: email,
            ),
          ),
        ],
      );
    });

    group('CreateAccountPasswordChanged', () {
      blocTest<CreateAccountBloc, CreateAccountState>(
        'emits password',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountPasswordChanged(password.value),
          );
        },
        expect: () => [
          CreateAccountState(
            form: CreateAccountForm(
              password: password,
            ),
          ),
        ],
      );
    });

    group('CreateAccountSubmitted', () {
      blocTest<CreateAccountBloc, CreateAccountState>(
        'emits [invalid] when emailForm is invalid',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountSubmitted(),
          );
        },
        expect: () => [
          CreateAccountState(
            form: CreateAccountForm(
              status: CreateAccountStatus.invalid,
            ),
          ),
        ],
      );

      blocTest<CreateAccountBloc, CreateAccountState>(
        'emits [loading, success] '
        'when authenticationRepository.register succeeds',
        setUp: () {
          when(
            () => authenticationRepository.register(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenAnswer((_) async {});
        },
        seed: () => CreateAccountState(
          form: CreateAccountForm(
            email: email,
            password: password,
          ),
        ),
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountSubmitted(),
          );
        },
        expect: () => [
          CreateAccountState(
            form: CreateAccountForm(
              status: CreateAccountStatus.loading,
              email: email,
              password: password,
            ),
          ),
          CreateAccountState(
            form: CreateAccountForm(
              status: CreateAccountStatus.success,
              email: email,
              password: password,
            ),
          ),
        ],
      );

      blocTest<CreateAccountBloc, CreateAccountState>(
        'emits [loading, failure] '
        'when authenticationRepository.register fails',
        setUp: () {
          when(
            () => authenticationRepository.register(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(RegistrationFailure('oops'));
        },
        seed: () => CreateAccountState(
          form: CreateAccountForm(
            email: email,
            password: password,
          ),
        ),
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountSubmitted(),
          );
        },
        expect: () => [
          CreateAccountState(
            form: CreateAccountForm(
              status: CreateAccountStatus.loading,
              email: email,
              password: password,
            ),
          ),
          CreateAccountState(
            form: CreateAccountForm(
              status: CreateAccountStatus.failure,
              email: email,
              password: password,
            ),
          ),
        ],
      );
    });

    group('CreateAccountTermsLinkPressed', () {
      blocTest<CreateAccountBloc, CreateAccountState>(
        'calls externalLinkRepository.launchTerms',
        setUp: () {
          when(
            externalLinkRepository.launchTermsLink,
          ).thenAnswer((_) async {
            return;
          });
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountTermsLinkPressed(),
          );
        },
        verify: (_) {
          verify(
            externalLinkRepository.launchTermsLink,
          ).called(1);
        },
      );
    });

    group('CreateAccountDataHandlingLinkPressed', () {
      blocTest<CreateAccountBloc, CreateAccountState>(
        'calls externalLinkRepository.launchIntegrityPolicyLink',
        setUp: () {
          when(
            externalLinkRepository.launchDataHandlingLink,
          ).thenAnswer((_) async {
            return;
          });
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountDataHandlingLinkPressed(),
          );
        },
        verify: (_) {
          verify(
            externalLinkRepository.launchDataHandlingLink,
          ).called(1);
        },
      );
    });
  });
}
