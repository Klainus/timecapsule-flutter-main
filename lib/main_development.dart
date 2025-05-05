import 'package:as_boilerplate_flutter/bootstrap.dart';
import 'package:as_boilerplate_flutter/firebase_options_dev.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  await bootstrap(
    debug: true,
    debugPrint: debugPrint,
    environment: 'development',
    baseUrl: '',
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );
}
