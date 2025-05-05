// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockCreateAccountBloc
    extends MockBloc<CreateAccountEvent, CreateAccountState>
    implements CreateAccountBloc {}

class MockCreateAccountForm extends Mock implements CreateAccountForm {}

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  group('CreateAccountPasswordTextField', () {
    const passwordErrorText = 'passwordErrorText';

    late CreateAccountBloc createAccountBloc;
    late CreateAccountForm createAccountForm;

    setUp(() {
      createAccountBloc = MockCreateAccountBloc();
      when(() => createAccountBloc.state).thenReturn(CreateAccountState());
      createAccountForm = MockCreateAccountForm();
      registerFallbackValue(MockAppLocalizations());
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: createAccountBloc,
        child: const CreateAccountPasswordTextField(),
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

    testWidgets(
      'renders error text',
      (tester) async {
        when(() => createAccountBloc.state).thenReturn(
          CreateAccountState(form: createAccountForm),
        );
        when(() => createAccountForm.passwordErrorText(any())).thenReturn(
          passwordErrorText,
        );
        await tester.pumpApp(buildSubject());
        expect(find.text(passwordErrorText), findsOneWidget);
      },
    );

    testWidgets(
      'adds CreateAccountPasswordChanged when security code changes',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.enterText(
          find.byType(CreateAccountPasswordTextField),
          'securityCode',
        );
        verify(
          () => createAccountBloc.add(
            const CreateAccountPasswordChanged('securityCode'),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'obscures text',
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
  });
}
