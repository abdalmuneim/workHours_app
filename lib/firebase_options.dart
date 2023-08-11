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
        return macos;
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
    apiKey: 'AIzaSyDcP9t3gc6x4o1XtwV2wqeb1xuWMJg4Nlc',
    appId: '1:270865024064:web:d0a2a8b3c0280189a04ba5',
    messagingSenderId: '270865024064',
    projectId: 'flutter-app-e4032',
    authDomain: 'flutter-app-e4032.firebaseapp.com',
    storageBucket: 'flutter-app-e4032.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCci5xvy0AvrvmClBuf3YMDgNmcRXUQr0E',
    appId: '1:270865024064:android:41c6897d62be522ba04ba5',
    messagingSenderId: '270865024064',
    projectId: 'flutter-app-e4032',
    storageBucket: 'flutter-app-e4032.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEiWQBapC0W41Ao59tFetrFSVIXCyEQ7Y',
    appId: '1:270865024064:ios:37f084065b5a1eaea04ba5',
    messagingSenderId: '270865024064',
    projectId: 'flutter-app-e4032',
    storageBucket: 'flutter-app-e4032.appspot.com',
    iosClientId: '270865024064-trvgu7btobh4b54g2do88addo3725ukh.apps.googleusercontent.com',
    iosBundleId: 'com.example.workhours',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEiWQBapC0W41Ao59tFetrFSVIXCyEQ7Y',
    appId: '1:270865024064:ios:7d2b4ae18bdd9bb3a04ba5',
    messagingSenderId: '270865024064',
    projectId: 'flutter-app-e4032',
    storageBucket: 'flutter-app-e4032.appspot.com',
    iosClientId: '270865024064-q38pitojdp9kos15k3jk7memvlj1ob97.apps.googleusercontent.com',
    iosBundleId: 'com.example.workhours.RunnerTests',
  );
}
