import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/analytics/bloc/analytics_bloc.dart';
import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:as_boilerplate_flutter/theme/bloc/theme_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:external_link_repository/external_link_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:nested/nested.dart';
import 'package:user_repository/user_repository.dart';

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {
  @override
  Stream<AuthenticationStatus> get status => const Stream.empty();

  @override
  AuthenticationStatus get currentStatus =>
      AuthenticationStatus.unauthenticated;
}

class MockExternalLinkRepository extends Mock
    implements ExternalLinkRepository {}

class MockUserRepository extends Mock implements UserRepository {
  @override
  Stream<User> get user => const Stream.empty();

  @override
  User get currentUser => User.empty;
}

class MockAnalyticsBloc extends MockBloc<AnalyticsEvent, void>
    implements AnalyticsBloc {}

class MockAppFlowBloc extends MockBloc<AppFlowEvent, AppFlowState>
    implements AppFlowBloc {
  @override
  AppFlowState get state => const AppFlowState(
        flow: AppFlow(),
      );
}

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {
  @override
  AuthenticationState get state => const AuthenticationState(
        status: AuthenticationStatus.unauthenticated,
        user: User.empty,
      );
}

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeMode>
    implements ThemeBloc {
  @override
  ThemeMode get state => ThemeMode.light;
}

class MockAppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const MockAppLocalizationsDelegate(this.l10n);

  final AppLocalizations l10n;

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(l10n);
  }

  @override
  bool isSupported(Locale locale) => true;

  @override
  bool shouldReload(MockAppLocalizationsDelegate old) => false;
}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widgetUnderTest, {
    AnalyticsRepository? analyticsRepository,
    AuthenticationRepository? authenticationRepository,
    ExternalLinkRepository? externalLinkRepository,
    UserRepository? userRepository,
    AnalyticsBloc? analyticsBloc,
    AppFlowBloc? appFlowBloc,
    AuthenticationBloc? authenticationBloc,
    ThemeBloc? themeBloc,
    List<Route<dynamic>> Function(String)? onGenerateInitialRoutes,
    BlocListener<dynamic, dynamic>? listener,
    GlobalKey<NavigatorState>? navigatorKey,
    NavigatorObserver? navigatorObserver,
    MockNavigator? rootNavigator,
    AppLocalizations? l10n,
  }) {
    Widget wrappedChild = MaterialApp(
      navigatorKey: navigatorKey,
      theme: const AppTheme.light().themeData,
      localizationsDelegates: l10n == null
          ? AppLocalizations.localizationsDelegates
          : [
              MockAppLocalizationsDelegate(l10n),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      navigatorObservers: [
        if (navigatorObserver != null) navigatorObserver,
      ],
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (_) => Scaffold(body: widgetUnderTest),
      ),
    );

    if (listener != null) {
      wrappedChild = Nested(
        children: [listener],
        child: wrappedChild,
      );
    }

    if (rootNavigator != null) {
      wrappedChild = MockNavigatorProvider(
        navigator: rootNavigator,
        child: wrappedChild,
      );
    }

    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: analyticsRepository ?? MockAnalyticsRepository(),
          ),
          RepositoryProvider.value(
            value: authenticationRepository ?? MockAuthenticationRepository(),
          ),
          RepositoryProvider.value(
            value: externalLinkRepository ?? MockExternalLinkRepository(),
          ),
          RepositoryProvider.value(
            value: userRepository ?? MockUserRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: analyticsBloc ?? MockAnalyticsBloc(),
            ),
            BlocProvider.value(
              value: appFlowBloc ?? MockAppFlowBloc(),
            ),
            BlocProvider.value(
              value: authenticationBloc ?? MockAuthenticationBloc(),
            ),
            BlocProvider.value(
              value: themeBloc ?? MockThemeBloc(),
            ),
          ],
          child: wrappedChild,
        ),
      ),
    );
  }

  Future<void> pumpRoute(
    Route<dynamic> route, {
    AuthenticationRepository? authenticationRepository,
    ExternalLinkRepository? externalLinkRepository,
    UserRepository? userRepository,
    AnalyticsBloc? analyticsBloc,
    AppFlowBloc? appFlowBloc,
    AuthenticationBloc? authenticationBloc,
    ThemeBloc? themeBloc,
  }) {
    return pumpApp(
      Navigator(onGenerateRoute: (_) => route),
      authenticationRepository: authenticationRepository,
      externalLinkRepository: externalLinkRepository,
      userRepository: userRepository,
      analyticsBloc: analyticsBloc,
      appFlowBloc: appFlowBloc,
      authenticationBloc: authenticationBloc,
      themeBloc: themeBloc,
    );
  }
}
