// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
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
    apiKey: 'AIzaSyD5qTlYVLj8g8lts0yC6CzMSokN_R-HWXM',
    appId: '1:1032637161994:web:67c98dee08cd49a7a8f5f3',
    messagingSenderId: '1032637161994',
    projectId: 'timecapsule-cfaf7',
    authDomain: 'timecapsule-cfaf7.firebaseapp.com',
    storageBucket: 'timecapsule-cfaf7.firebasestorage.app',
    measurementId: 'G-8XWB6JPQG2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6EKwKTyajEhu49jjZZXlaG5nhPPzhg6A',
    appId: '1:1032637161994:android:14c0ec79bc300ac6a8f5f3',
    messagingSenderId: '1032637161994',
    projectId: 'timecapsule-cfaf7',
    storageBucket: 'timecapsule-cfaf7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdyDP2HfvZhaazZzEuJx28bd6SSqlE_rY',
    appId: '1:1032637161994:ios:812fe10cd6a100fda8f5f3',
    messagingSenderId: '1032637161994',
    projectId: 'timecapsule-cfaf7',
    storageBucket: 'timecapsule-cfaf7.firebasestorage.app',
    iosBundleId: 'se.appshack.asboilerplateflutter',
  );

}