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
    apiKey: 'AIzaSyBCkWXTcBEwwOPSFW9baFpFdvMH7mEnekg',
    appId: '1:120143959860:web:7fce83171fbf12ccf07761',
    messagingSenderId: '120143959860',
    projectId: 'tasker-1bf50',
    authDomain: 'tasker-1bf50.firebaseapp.com',
    storageBucket: 'tasker-1bf50.firebasestorage.app',
    measurementId: 'G-QQ33673QPL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCq2QZavaQwnXWDLShlV4I50FgrKPxGd4s',
    appId: '1:120143959860:android:60574cc9336cd611f07761',
    messagingSenderId: '120143959860',
    projectId: 'tasker-1bf50',
    storageBucket: 'tasker-1bf50.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZF-EvWBnaNfAFNjXqTtmL8SZQ24WDX7Y',
    appId: '1:120143959860:ios:42dddb7143f54d70f07761',
    messagingSenderId: '120143959860',
    projectId: 'tasker-1bf50',
    storageBucket: 'tasker-1bf50.firebasestorage.app',
    iosBundleId: 'com.example.tasker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZF-EvWBnaNfAFNjXqTtmL8SZQ24WDX7Y',
    appId: '1:120143959860:ios:42dddb7143f54d70f07761',
    messagingSenderId: '120143959860',
    projectId: 'tasker-1bf50',
    storageBucket: 'tasker-1bf50.firebasestorage.app',
    iosBundleId: 'com.example.tasker',
  );

}