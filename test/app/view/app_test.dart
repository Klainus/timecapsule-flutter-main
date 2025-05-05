// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/app/view/app.dart';
import 'package:as_boilerplate_flutter/app/view/app_view.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:external_link_repository/external_link_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockExternalLinkRepository extends Mock
    implements ExternalLinkRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  initMockHydratedStorage();

  late AnalyticsRepository analyticsRepository;
  late AuthenticationRepository authenticationRepository;
  late ExternalLinkRepository externalLinkRepository;
  late UserRepository userRepository;

  setUp(() {
    analyticsRepository = MockAnalyticsRepository();
    authenticationRepository = MockAuthenticationRepository();
    externalLinkRepository = MockExternalLinkRepository();
    userRepository = MockUserRepository();

    when(() => authenticationRepository.status).thenAnswer(
      (_) => Stream.empty(),
    );
    when(() => authenticationRepository.currentStatus).thenReturn(
      AuthenticationStatus.unauthenticated,
    );
    when(() => userRepository.user).thenAnswer((_) => Stream.empty());
    when(() => userRepository.currentUser).thenReturn(User.empty);
    when(() => userRepository.persistedUserState).thenAnswer(
      (_) => Stream.empty(),
    );
    when(() => userRepository.currentPersistedUserState).thenReturn(
      PersistedUserState(),
    );
  });

  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        App(
          analyticsRepository: analyticsRepository,
          authenticationRepository: authenticationRepository,
          externalLinkRepository: externalLinkRepository,
          userRepository: userRepository,
        ),
      );

      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
