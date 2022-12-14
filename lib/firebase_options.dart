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
    apiKey: 'AIzaSyBjfJKljkk7V5VcKuDVoVtwTKxGdDQfUIw',
    appId: '1:879059285853:web:659b1799407e03929edab4',
    messagingSenderId: '879059285853',
    projectId: 'eduha-4553f',
    authDomain: 'eduha-4553f.firebaseapp.com',
    storageBucket: 'eduha-4553f.appspot.com',
    measurementId: 'G-4KMGP6CTDE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtPo7HR4QEF96Yqmj01ZtQg_Rm2bsjHFQ',
    appId: '1:879059285853:android:6a2f066265ed86d79edab4',
    messagingSenderId: '879059285853',
    projectId: 'eduha-4553f',
    storageBucket: 'eduha-4553f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBB_EQlU8gKxXde6AJv_Z4Kx_JQDKJUVkw',
    appId: '1:879059285853:ios:5d8387d202042bb59edab4',
    messagingSenderId: '879059285853',
    projectId: 'eduha-4553f',
    storageBucket: 'eduha-4553f.appspot.com',
    iosClientId: '879059285853-68j4mk69kkfrtlo4h5r1bqate0pi9ro2.apps.googleusercontent.com',
    iosBundleId: 'com.example.eduha',
  );
}
