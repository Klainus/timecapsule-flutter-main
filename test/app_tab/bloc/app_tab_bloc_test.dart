// ignore_for_file: prefer_const_constructors

import 'package:as_boilerplate_flutter/app_tab/app_tab.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('AppTabBloc', () {
    AppTabBloc buildBloc() => AppTabBloc();

    test('initial state is AppTab.initial', () {
      expect(buildBloc().state, AppTab.initial);
    });

    group('AppTabPressed', () {
      blocTest<AppTabBloc, AppTab>(
        'emits tab',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppTabPressed(1),
          );
        },
        expect: () => [
          AppTab.values[1],
        ],
      );

      test('supports value equality', () {
        expect(
          AppTabPressed(1),
          AppTabPressed(1),
        );
      });
    });
  });
}
