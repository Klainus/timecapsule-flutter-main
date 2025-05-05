// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockLoginForm extends Mock implements LoginForm {}

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  group('LoginPasswordTextField', () {
    const passwordErrorText = 'passwordErrorText';

    late LoginBloc loginBloc;
    late LoginForm loginForm;

    setUp(() {
      loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(LoginState());
      loginForm = MockLoginForm();
      registerFallbackValue(MockAppLocalizations());
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: loginBloc,
        child: const LoginPasswordTextField(),
      );
    }

    testWidgets('renders TextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets(
      'renders error text',
      (tester) async {
        when(() => loginBloc.state).thenReturn(
          LoginState(form: loginForm),
        );
        when(() => loginForm.passwordErrorText(any())).thenReturn(
          passwordErrorText,
        );
        await tester.pumpApp(buildSubject());
        expect(find.text(passwordErrorText), findsOneWidget);
      },
    );

    testWidgets(
      'obscures text initially',
      (tester) async {
        await tester.pumpApp(buildSubject());
        final textField = tester.widget<TextField>(
          find.byType(TextField),
        );
        expect(textField.obscureText, isTrue);
      },
    );

    testWidgets(
      'does not obscure text when IconButton is pressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.tap(find.byType(IconButton));
        await tester.pump();
        final textField = tester.widget<TextField>(
          find.byType(TextField),
        );
        expect(textField.obscureText, isFalse);
      },
    );

    testWidgets(
      'adds LoginPasswordChanged when text changes',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.enterText(
          find.byType(LoginPasswordTextField),
          'password',
        );
        verify(
          () => loginBloc.add(
            const LoginPasswordChanged('password'),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'adds LoginSubmitted when submitted',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.enterText(find.byType(TextField), 'text');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        verify(() => loginBloc.add(LoginSubmitted())).called(1);
      },
    );
  });
}
