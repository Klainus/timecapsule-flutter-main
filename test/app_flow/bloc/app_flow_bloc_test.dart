// ignore_for_file: prefer_const_constructors

import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/init_mock_hydrated_storage.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  initMockHydratedStorage();

  final loggedInUser = User(
    id: 'id',
    email: 'email',
    firstName: 'firstName',
    lastName: 'lastName',
    isStaff: false,
  );

  group('AppFlowBloc', () {
    late UserRepository userRepository;

    setUp(() {
      userRepository = MockUserRepository();
      when(() => userRepository.user).thenAnswer(
        (_) => const Stream.empty(),
      );
      when(() => userRepository.currentUser).thenReturn(User.empty);
    });

    AppFlowBloc buildBloc() => AppFlowBloc(
          userRepository: userRepository,
        );

    test(
        'initial state is AppFlowState with AppFlow.from initial flow '
        'and current user', () {
      expect(
        buildBloc().state,
        AppFlowState(
          flow: AppFlow.from(AppFlow(), User.empty),
        ),
      );
    });

    group('AppFlowUserChanged', () {
      blocTest<AppFlowBloc, AppFlowState>(
        'emits state with AppFlow.from state.flow and event.user',
        setUp: () {
          when(() => userRepository.user).thenAnswer(
            (_) => Stream.value(loggedInUser),
          );
        },
        build: buildBloc,
        expect: () => [
          AppFlowState(
            flow: AppFlow.from(AppFlow(), loggedInUser),
          ),
        ],
      );
    });

    group('AppFlowEnableAnalyticsCompleted', () {
      blocTest<AppFlowBloc, AppFlowState>(
        'emits state with isEnableAnalyticsCompleted = true',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppFlowEnableAnalyticsCompleted(),
          );
        },
        expect: () => [
          AppFlowState(
            flow: AppFlow(
              isEnableAnalyticsCompleted: true,
            ),
          ),
        ],
      );
    });

    group('fromJson', () {
      test(
          'returns AppFlowState with AppFlow.from persisted flow '
          'and currentUser', () {
        final flow = AppFlow(
          isLoggedIn: true,
        );
        final state = AppFlowState(flow: flow);
        final json = state.toJson();

        final bloc = buildBloc();

        expect(
          bloc.fromJson(json),
          AppFlowState(
            flow: AppFlow.from(flow, User.empty),
          ),
        );
      });
    });

    group('toJson', () {
      test('returns json', () {
        final flow = AppFlow(
          isLoggedIn: true,
        );
        final state = AppFlowState(flow: flow);
        final bloc = buildBloc();

        expect(
          bloc.toJson(state),
          state.toJson(),
        );
      });
    });
  });
}
