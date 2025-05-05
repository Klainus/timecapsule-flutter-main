// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:as_boilerplate_flutter/settings/view/settings_page.dart';
import 'package:as_boilerplate_flutter/theme/bloc/theme_bloc.dart';
import 'package:as_boilerplate_flutter/theme/widgets/theme_radio_group.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeMode>
    implements ThemeBloc {}

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  final user = User(
    id: 'id',
    email: 'email',
    firstName: 'firstName',
    lastName: 'lastName',
    isStaff: false,
  );

  group(SettingsPage, () {
    late AuthenticationBloc authenticationBloc;
    late ThemeBloc themeBloc;
    late AppLocalizations l10n;

    setUp(() {
      authenticationBloc = MockAuthenticationBloc();
      themeBloc = MockThemeBloc();
      l10n = MockAppLocalizations();
      when(() => authenticationBloc.state).thenReturn(
        AuthenticationState(
          status: AuthenticationStatus.authenticated,
          user: user,
        ),
      );
      when(() => themeBloc.state).thenReturn(ThemeMode.light);
      when(() => l10n.settingsThemeTitle).thenReturn('settingsThemeTitle');
      when(() => l10n.logOutAction).thenReturn('logOutAction');
    });

    Widget buildSubject() {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: authenticationBloc),
          BlocProvider.value(value: themeBloc),
        ],
        child: SettingsView(),
      );
    }

    group('route', () {
      testWidgets('renders $SettingsPage', (tester) async {
        await tester.pumpApp(
          SettingsPage(),
        );
        expect(find.byType(SettingsPage), findsOneWidget);
      });
    });

    testWidgets('renders l10n.settingsPageTitle', (tester) async {
      const settingsPageTitle = 'settingsPageTitle';
      when(() => l10n.settingsPageTitle).thenReturn(settingsPageTitle);
      await tester.pumpApp(
        buildSubject(),
        l10n: l10n,
      );
      expect(find.text(settingsPageTitle), findsOneWidget);
    });

    testWidgets('renders $ThemeRadioGroup', (tester) async {
      when(() => themeBloc.state).thenReturn(
        ThemeMode.light,
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThemeRadioGroup), findsOneWidget);
    });

    testWidgets(
        'adds $AuthenticationLogoutPressed to $AuthenticationBloc '
        'when $AppFilledButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(AppFilledButton));
      verify(
        () => authenticationBloc.add(AuthenticationLogoutPressed()),
      ).called(1);
    });
  });
}
