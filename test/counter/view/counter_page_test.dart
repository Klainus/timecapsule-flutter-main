// ignore_for_file: prefer_const_constructors

import 'package:as_boilerplate_flutter/counter/counter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../helpers/helpers.dart';

class MockCounterBloc extends MockBloc<CounterEvent, CounterState>
    implements CounterBloc {}

void main() {
  group('CounterPage', () {
    late CounterBloc counterBloc;
    late MockNavigator navigator;

    setUp(() {
      counterBloc = MockCounterBloc();
      when(() => counterBloc.state).thenReturn(CounterState());
      navigator = MockNavigator();
      when(() => navigator.canPop()).thenReturn(false);
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: BlocProvider.value(
          value: counterBloc,
          child: CounterView(),
        ),
      );
    }

    group('route', () {
      testWidgets('renders CounterPage', (tester) async {
        await tester.pumpApp(
          CounterPage(),
        );
        expect(find.byType(CounterPage), findsOneWidget);
      });
    });

    testWidgets('renders current count', (tester) async {
      const count = 42;

      when(() => counterBloc.state).thenReturn(
        CounterState(count: count),
      );
      await tester.pumpApp(buildSubject());
      expect(find.text('$count'), findsOneWidget);
    });

    testWidgets('adds CounterIncrementPressed when increment button is tapped',
        (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byIcon(Icons.add));
      verify(() => counterBloc.add(CounterIncrementPressed())).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => counterBloc.add(CounterDecrementPressed())).called(1);
    });
  });
}
