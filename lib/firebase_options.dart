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
    apiKey: 'AIzaSyBFZnk4vKMpMiUwdTBbBUjBJR_apQaygEM',
    appId: '1:869492648319:web:8e563c0a7881a062b5d24a',
    messagingSenderId: '869492648319',
    projectId: 'chatapp-1fae9',
    authDomain: 'chatapp-1fae9.firebaseapp.com',
    storageBucket: 'chatapp-1fae9.appspot.com',
    measurementId: 'G-80F60628FT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaLrdT7eWNQCagKf6mXmrfGSKQXgmbB10',
    appId: '1:869492648319:android:3918ce94979425d5b5d24a',
    messagingSenderId: '869492648319',
    projectId: 'chatapp-1fae9',
    storageBucket: 'chatapp-1fae9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcKOpDrBSPgNNKvQfrG9P297awFPN96kA',
    appId: '1:869492648319:ios:cbaf306dc4285214b5d24a',
    messagingSenderId: '869492648319',
    projectId: 'chatapp-1fae9',
    storageBucket: 'chatapp-1fae9.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcKOpDrBSPgNNKvQfrG9P297awFPN96kA',
    appId: '1:869492648319:ios:cbaf306dc4285214b5d24a',
    messagingSenderId: '869492648319',
    projectId: 'chatapp-1fae9',
    storageBucket: 'chatapp-1fae9.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFZnk4vKMpMiUwdTBbBUjBJR_apQaygEM',
    appId: '1:869492648319:web:d4694d6438498378b5d24a',
    messagingSenderId: '869492648319',
    projectId: 'chatapp-1fae9',
    authDomain: 'chatapp-1fae9.firebaseapp.com',
    storageBucket: 'chatapp-1fae9.appspot.com',
    measurementId: 'G-6F29B3C54H',
  );
}
