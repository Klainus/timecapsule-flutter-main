// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
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
  group('CreateAccountEmailTextField', () {
    const emailErrorText = 'emailErrorText';

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
        child: const CreateAccountEmailTextField(),
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
      'renders email error text',
      (tester) async {
        when(() => createAccountBloc.state).thenReturn(
          CreateAccountState(form: createAccountForm),
        );
        when(() => createAccountForm.emailErrorText(any()))
            .thenReturn(emailErrorText);
        await tester.pumpApp(buildSubject());
        expect(find.text(emailErrorText), findsOneWidget);
      },
    );

    testWidgets(
      'adds CreateAccountEmailChanged when email changes',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.enterText(
          find.byType(CreateAccountEmailTextField),
          'email',
        );
        verify(
          () => createAccountBloc.add(const CreateAccountEmailChanged('email')),
        ).called(1);
      },
    );
  });
}
