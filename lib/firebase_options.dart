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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCz94HV6LXsSw3rdMSMnGFKvKJ82ZgiNmk',
    appId: '1:440607721662:android:76b1d78e61d6747e92f6ef',
    messagingSenderId: '440607721662',
    projectId: 'khalasha-53a85',
    storageBucket: 'khalasha-53a85.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGoECGoLFjC7HAPnZRlfhh6dNXKuI_OK0',
    appId: '1:440607721662:ios:01ccf20d7877c10b92f6ef',
    messagingSenderId: '440607721662',
    projectId: 'khalasha-53a85',
    storageBucket: 'khalasha-53a85.appspot.com',
    androidClientId: '440607721662-jv0cgo22dhi1v6eluu5d7ot1jb6a2bn3.apps.googleusercontent.com',
    iosClientId: '440607721662-mrpjc6l92m6ca4nv8i79j1eu2uiadqga.apps.googleusercontent.com',
    iosBundleId: 'com.khlasha.app',
  );
}
