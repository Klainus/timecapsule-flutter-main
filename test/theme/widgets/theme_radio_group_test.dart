import 'package:as_boilerplate_flutter/theme/bloc/theme_bloc.dart';
import 'package:as_boilerplate_flutter/theme/widgets/theme_radio_group.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeMode>
    implements ThemeBloc {}

void main() {
  group('ThemeRadioGroup', () {
    late ThemeBloc themeBloc;

    setUp(() {
      themeBloc = MockThemeBloc();
      when(() => themeBloc.state).thenReturn(ThemeMode.light);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: themeBloc,
        child: const ThemeRadioGroup(),
      );
    }

    testWidgets('renders RadioListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(RadioListTile<ThemeMode>), findsAny);
    });

    testWidgets('adds ThemeOptionPressed when pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RadioListTile<ThemeMode> &&
              widget.value == ThemeMode.dark,
        ),
      );
      verify(() => themeBloc.add(const ThemeOptionPressed(ThemeMode.dark)))
          .called(1);
    });
  });
}
