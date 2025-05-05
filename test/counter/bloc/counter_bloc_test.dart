import 'package:as_boilerplate_flutter/counter/bloc/counter_bloc.dart';
import 'package:as_boilerplate_flutter/counter/bloc/counter_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    test('initial state is CounterState', () {
      expect(
        CounterBloc().state,
        equals(
          const CounterState(),
        ),
      );
    });

    blocTest<CounterBloc, CounterState>(
      'emits [1] on CounterIncrementPressed',
      build: CounterBloc.new,
      act: (bloc) => bloc.add(
        const CounterIncrementPressed(),
      ),
      expect: () => [
        const CounterState(count: 1),
      ],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [-1] on CounterDecrementPressed',
      build: CounterBloc.new,
      act: (bloc) => bloc.add(
        const CounterDecrementPressed(),
      ),
      expect: () => [
        const CounterState(count: -1),
      ],
    );
  });
}
