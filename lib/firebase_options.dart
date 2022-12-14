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
    apiKey: 'AIzaSyBKQejNLCbXHGyQSF5uctC11OdMMvR1Nvo',
    appId: '1:926576799763:web:fad20c1020c52f9aaa0fe6',
    messagingSenderId: '926576799763',
    projectId: 'e-learning-4122a',
    authDomain: 'e-learning-4122a.firebaseapp.com',
    storageBucket: 'e-learning-4122a.appspot.com',
    measurementId: 'G-3VR9JM698Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6tuK1BZZgyx9725WgJsuR-6-7ROEEzFo',
    appId: '1:926576799763:android:6a7f6e333c18bec8aa0fe6',
    messagingSenderId: '926576799763',
    projectId: 'e-learning-4122a',
    storageBucket: 'e-learning-4122a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARsg1mZyDV-Loz2-_8un-XBa5DGu-dypQ',
    appId: '1:926576799763:ios:02362f16f1ab95b4aa0fe6',
    messagingSenderId: '926576799763',
    projectId: 'e-learning-4122a',
    storageBucket: 'e-learning-4122a.appspot.com',
    iosClientId: '926576799763-dke6pphqba6nldi5p2k6p35etiirgt1n.apps.googleusercontent.com',
    iosBundleId: 'com.example.eLearningApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARsg1mZyDV-Loz2-_8un-XBa5DGu-dypQ',
    appId: '1:926576799763:ios:02362f16f1ab95b4aa0fe6',
    messagingSenderId: '926576799763',
    projectId: 'e-learning-4122a',
    storageBucket: 'e-learning-4122a.appspot.com',
    iosClientId: '926576799763-dke6pphqba6nldi5p2k6p35etiirgt1n.apps.googleusercontent.com',
    iosBundleId: 'com.example.eLearningApp',
  );
}
