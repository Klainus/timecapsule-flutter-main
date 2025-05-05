import 'package:as_boilerplate_flutter/bootstrap.dart';
import 'package:as_boilerplate_flutter/firebase_options.dart';

Future<void> main() async {
  await bootstrap(
    debug: false,
    environment: 'production',
    baseUrl: '',
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );
}
