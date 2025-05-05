// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockLoginForm extends Mock implements LoginForm {}

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  group('LoginEmailTextField', () {
    const emailErrorText = 'emailErrorText';

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
        child: const LoginEmailTextField(),
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          buildSubject,
          returnsNormally,
        );
      });
    });

    testWidgets('is rendered', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginEmailTextField), findsOneWidget);
    });

    testWidgets(
      'renders email error text',
      (tester) async {
        when(() => loginBloc.state).thenReturn(
          LoginState(form: loginForm),
        );
        when(() => loginForm.emailErrorText(any())).thenReturn(emailErrorText);
        await tester.pumpApp(buildSubject());
        expect(find.text(emailErrorText), findsOneWidget);
      },
    );

    testWidgets(
      'adds LoginEmailChanged when email changes',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.enterText(find.byType(LoginEmailTextField), 'email');
        verify(
          () => loginBloc.add(const LoginEmailChanged('email')),
        ).called(1);
      },
    );
  });
}
