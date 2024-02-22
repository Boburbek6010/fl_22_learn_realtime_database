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
    apiKey: 'AIzaSyCi0rIT3ZXLlQ6RqlVPrVERSkEdxBrf8AI',
    appId: '1:743328127664:web:8461d4ea80854654a3f975',
    messagingSenderId: '743328127664',
    projectId: 'realtime-database-29968',
    authDomain: 'realtime-database-29968.firebaseapp.com',
    storageBucket: 'realtime-database-29968.appspot.com',
    measurementId: 'G-SHDTV4Q51L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkhXs5vuYcFHwIRKMDiUt2qLItIin65U0',
    appId: '1:743328127664:android:ee5dd951ef4d667da3f975',
    messagingSenderId: '743328127664',
    projectId: 'realtime-database-29968',
    storageBucket: 'realtime-database-29968.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByTjvy9dn9LJN4ZTeNmWde1pvANvnIPmQ',
    appId: '1:743328127664:ios:d221dec3fb6e9815a3f975',
    messagingSenderId: '743328127664',
    projectId: 'realtime-database-29968',
    storageBucket: 'realtime-database-29968.appspot.com',
    iosBundleId: 'com.pdp.fl22LearnRealtimeDatabase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByTjvy9dn9LJN4ZTeNmWde1pvANvnIPmQ',
    appId: '1:743328127664:ios:825403797d4167aaa3f975',
    messagingSenderId: '743328127664',
    projectId: 'realtime-database-29968',
    storageBucket: 'realtime-database-29968.appspot.com',
    iosBundleId: 'com.pdp.fl22LearnRealtimeDatabase.RunnerTests',
  );
}
