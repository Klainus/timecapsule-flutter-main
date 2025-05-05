import 'package:as_boilerplate_flutter/theme/bloc/theme_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemeBloc', () {
    test('initial state is ThemeMode.system', () {
      expect(
        ThemeBloc().state,
        equals(
          ThemeMode.system,
        ),
      );
    });

    blocTest<ThemeBloc, ThemeMode>(
      'emits option on ThemeOptionPressed',
      build: ThemeBloc.new,
      act: (bloc) => bloc.add(
        const ThemeOptionPressed(
          ThemeMode.dark,
        ),
      ),
      expect: () => [
        ThemeMode.dark,
      ],
    );
  });
}
