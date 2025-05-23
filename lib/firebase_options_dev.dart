// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDWuCMfjD70f2wuAuBZuvKd2lDTtip6vLY',
    appId: '1:735131000041:web:5bd3a0eabe6313547aa478',
    messagingSenderId: '735131000041',
    projectId: 'boilerplate-dev-f79bb',
    authDomain: 'boilerplate-dev-f79bb.firebaseapp.com',
    storageBucket: 'boilerplate-dev-f79bb.firebasestorage.app',
    measurementId: 'G-98HQQ65JL2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxaY7aKAOrlw506IY3qXhIlD08dYLajnQ',
    appId: '1:735131000041:android:8d25df667eb0097e7aa478',
    messagingSenderId: '735131000041',
    projectId: 'boilerplate-dev-f79bb',
    storageBucket: 'boilerplate-dev-f79bb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAM_SFAD56a6twTGbIFzdBTGf71GpBy5ao',
    appId: '1:735131000041:ios:162e73f00715082d7aa478',
    messagingSenderId: '735131000041',
    projectId: 'boilerplate-dev-f79bb',
    storageBucket: 'boilerplate-dev-f79bb.firebasestorage.app',
    iosBundleId: 'se.appshack.asboilerplateflutter.dev',
  );
}
