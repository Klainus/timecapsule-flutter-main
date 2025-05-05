// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../helpers/helpers.dart';

class MockCreateAccountBloc
    extends MockBloc<CreateAccountEvent, CreateAccountState>
    implements CreateAccountBloc {}

void main() {
  group('CreateAccountPage', () {
    late CreateAccountBloc createAccountBloc;
    late MockNavigator navigator;

    setUp(() {
      createAccountBloc = MockCreateAccountBloc();
      navigator = MockNavigator();
      when(() => createAccountBloc.state).thenReturn(CreateAccountState());
      when(navigator.canPop).thenReturn(true);
      when(() => navigator.push<void>(any())).thenAnswer((_) async {
        return;
      });
      when(() => navigator.pop<void>(any())).thenAnswer((_) async {
        return;
      });
      when(() => navigator.pushAndRemoveUntil<dynamic>(any(), any()))
          .thenAnswer((_) async {
        return null;
      });
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: BlocProvider.value(
          value: createAccountBloc,
          child: const CreateAccountPage(),
        ),
      );
    }

    group('route', () {
      testWidgets('renders CreateAccountPage', (tester) async {
        await tester.pumpRoute(
          CreateAccountPage.route(),
        );
        expect(find.byType(CreateAccountPage), findsOneWidget);
      });
    });

    testWidgets('navigates when CreateAccount status changes to success',
        (tester) async {
      final loadingState = CreateAccountState()
          .copyWith
          .form(status: CreateAccountStatus.loading);
      final successState = CreateAccountState()
          .copyWith
          .form(status: CreateAccountStatus.success);

      whenListen(
        createAccountBloc,
        Stream.fromIterable([
          loadingState,
          successState,
        ]),
      );

      await tester.pumpApp(buildSubject());

      verify(() => navigator.pushAndRemoveUntil<dynamic>(any(), any()))
          .called(1);
    });

    testWidgets('renders BaseAppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(BaseAppBar), findsOneWidget);
    });

    testWidgets('renders AppFilledButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppFilledButton), findsOneWidget);
    });

    testWidgets('renders CreateAccountEmailTextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CreateAccountEmailTextField), findsOneWidget);
    });

    testWidgets('renders CreateAccountPasswordTextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CreateAccountPasswordTextField), findsOneWidget);
    });

    testWidgets('adds CreateAccountSubmitted when AppFilledButton is tapped',
        (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(AppFilledButton));
      verify(
        () => createAccountBloc.add(
          const CreateAccountSubmitted(),
        ),
      ).called(1);
    });
  });
}
