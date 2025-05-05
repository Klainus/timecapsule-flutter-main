// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../helpers/helpers.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockLoginForm extends Mock implements LoginForm {}

void main() {
  group('LoginPage', () {
    late LoginBloc loginBloc;
    late LoginForm loginForm;
    late MockNavigator navigator;

    setUp(() {
      loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(LoginState());
      loginForm = MockLoginForm();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => navigator.pushAndRemoveUntil<dynamic>(any(), any()))
          .thenAnswer((_) async {
        return null;
      });
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: BlocProvider.value(
          value: loginBloc,
          child: LoginPage(),
        ),
      );
    }

    group('route', () {
      testWidgets('renders LoginPage', (tester) async {
        await tester.pumpRoute(
          LoginPage.route(),
        );
        expect(find.byType(LoginPage), findsOneWidget);
      });
    });

    testWidgets('renders BaseAppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(BaseAppBar), findsOneWidget);
    });

    testWidgets('adds LoginEmailSubmitted when AppFilledButton is pressed',
        (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(AppFilledButton));
      verify(() => loginBloc.add(LoginSubmitted())).called(1);
    });

    testWidgets('renders a loading button when state is loading',
        (tester) async {
      when(() => loginBloc.state).thenReturn(
        LoginState(form: loginForm),
      );
      when(() => loginForm.isLoading).thenReturn(true);
      await tester.pumpApp(buildSubject());

      final finder = find.byType(AppFilledButton);
      final widget = tester.widget(finder) as AppFilledButton;

      expect(
        widget.isLoading,
        true,
      );

      await tester.tap(find.byType(AppFilledButton));
      verifyNever(() => loginBloc.add(LoginSubmitted()));
    });

    testWidgets('renders LoginEmailTextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginEmailTextField), findsOneWidget);
    });
  });
}
