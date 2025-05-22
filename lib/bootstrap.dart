import 'dart:async';

import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_client_platform_configuration/app_client_platform_configuration.dart';
import 'package:app_logging/app_logging.dart';
import 'package:as_boilerplate_flutter/add_capsule/models/hive_adapter.dart';
import 'package:as_boilerplate_flutter/app/app_bloc_observer.dart';
import 'package:as_boilerplate_flutter/app/view/app.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:error_tracking/error_tracking.dart';
import 'package:external_link_repository/external_link_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_repository/user_repository.dart';

Future<void> bootstrap({
  required String environment,
  required String baseUrl,
  required bool debug,
  required FirebaseOptions firebaseOptions,
  void Function(String?)? debugPrint,
}) async {
  await ErrorTracking.init(
    debug: debug,
    environment: environment,
    appRunner: () async {
      WidgetsFlutterBinding.ensureInitialized();

      AppLogging.init(debug: debug);

      final firebaseApp = await Firebase.initializeApp(
        name: 'as-boilerplate-flutter',
        options: firebaseOptions,
      );

      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive
        ..init(appDocumentDir.path)
        ..registerAdapter(TimeCapsuleAdapter());

      final analyticsRepository = AnalyticsRepository(
        firebaseApp,
        FirebaseAnalytics.instance,
        debug: debug,
      );

      Bloc.observer = AppBlocObserver(
        AppLogging.logger,
        analyticsRepository,
      );

      HydratedStorageDirectory hydratedStorageDirectory;
      CookieJar cookieJar;

      if (kIsWeb) {
        hydratedStorageDirectory = HydratedStorageDirectory.web;
        cookieJar = WebCookieJar();
      } else {
        final directory = await getApplicationDocumentsDirectory();
        final path = directory.path;
        hydratedStorageDirectory = HydratedStorageDirectory(path);
        cookieJar = PersistCookieJar(
          storage: FileStorage('$path/.cookies/'),
        );
      }

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: hydratedStorageDirectory,
      );

      final client = AppClient(
        baseUrl: baseUrl,
        cookieJar: cookieJar,
        addPlatformConfiguration: addPlatformConfiguration,
        debugPrint: debugPrint,
      );

      final firebaseAuth = FirebaseAuth.instance;

      final usersApi = UsersApi(client.http);

      final authenticationApi = AuthenticationApi(
        firebaseAuth: firebaseAuth,
      );

      final authenticationRepository = AuthenticationRepository(
        authenticationApi,
      );

      const externalLinkRepository = ExternalLinkRepository(
        ExternalLinkService(),
        AppSettingsService(),
      );

      final userRepository = UserRepository(
        authenticationApi: authenticationApi,
        userService: UserService(usersApi: usersApi),
        userStorageWrapper: UserStorageWrapper(),
      );

      try {
        await userRepository.user.first.timeout(
          const Duration(seconds: 5),
        );
      } catch (error, stackTrace) {
        AppLogging.logger.severe(
          'Timed out waiting for initial user',
          error,
          stackTrace,
        );
      }

      runApp(
        App(
          analyticsRepository: analyticsRepository,
          authenticationRepository: authenticationRepository,
          externalLinkRepository: externalLinkRepository,
          userRepository: userRepository,
        ),
      );
    },
  );
}
