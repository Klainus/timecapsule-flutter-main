// ignore_for_file: prefer_const_constructors

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

void main() {
  group('PolicyLinks', () {
    late CreateAccountBloc createAccountBloc;

    setUp(() {
      createAccountBloc = MockCreateAccountBloc();
      when(() => createAccountBloc.state).thenReturn(CreateAccountState());
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: createAccountBloc,
        child: PolicyLinks(),
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
        'adds CreateAccountTermsLinkPressed '
        'when terms text is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.ensureVisible(find.byType(TermsLink));
      await tester.tap(find.byType(TermsLink));
      verify(
        () => createAccountBloc.add(CreateAccountTermsLinkPressed()),
      ).called(1);
    });

    testWidgets(
        'adds CreateAccountDataHandlingLinkPressed '
        'when policy text is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.ensureVisible(find.byType(DataHandlingLink));
      await tester.tap(find.byType(DataHandlingLink));
      verify(
        () => createAccountBloc.add(CreateAccountDataHandlingLinkPressed()),
      ).called(1);
    });
  });
}
