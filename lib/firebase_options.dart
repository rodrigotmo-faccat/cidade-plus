// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDo94LopetLsfZEHMoBoWJt576vLDN8Jfc',
    appId: '1:1024611041805:web:6a202fe75f308df0fb4b44',
    messagingSenderId: '1024611041805',
    projectId: 'cidade-plus',
    authDomain: 'cidade-plus.firebaseapp.com',
    storageBucket: 'cidade-plus.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDq5TW9xFSk9x6t8OH6YoIXQyOfys8tFP4',
    appId: '1:1024611041805:android:1c9f8c4cf0ce4480fb4b44',
    messagingSenderId: '1024611041805',
    projectId: 'cidade-plus',
    storageBucket: 'cidade-plus.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAl5ommSrBb1Uz0NeWwMDxR5RO2dnCyAcg',
    appId: '1:1024611041805:ios:9785372155662adcfb4b44',
    messagingSenderId: '1024611041805',
    projectId: 'cidade-plus',
    storageBucket: 'cidade-plus.firebasestorage.app',
    iosBundleId: 'com.example.trabDispositivosMoveis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAl5ommSrBb1Uz0NeWwMDxR5RO2dnCyAcg',
    appId: '1:1024611041805:ios:9785372155662adcfb4b44',
    messagingSenderId: '1024611041805',
    projectId: 'cidade-plus',
    storageBucket: 'cidade-plus.firebasestorage.app',
    iosBundleId: 'com.example.trabDispositivosMoveis',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDo94LopetLsfZEHMoBoWJt576vLDN8Jfc',
    appId: '1:1024611041805:web:1c036d862f08d721fb4b44',
    messagingSenderId: '1024611041805',
    projectId: 'cidade-plus',
    authDomain: 'cidade-plus.firebaseapp.com',
    storageBucket: 'cidade-plus.firebasestorage.app',
  );
}