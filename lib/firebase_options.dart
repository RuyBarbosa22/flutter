import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

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
    apiKey: 'AIzaSyB0r6RDJkjjR1PJ74uZjrKuVJnIbNCPy2U',
    appId: '1:857492878101:web:9ec3a67bc1198b0855af1c',
    messagingSenderId: '857492878101',
    projectId: 'meurango-9959d',
    authDomain: 'meurango-9959d.firebaseapp.com',
    storageBucket: 'meurango-9959d.firebasestorage.app',
    measurementId: 'G-X623EN89SS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzBxRqK_l7Rp9SoNPVPAbeHOnpamy-jpc',
    appId: '1:857492878101:android:812a8311095bf1b455af1c',
    messagingSenderId: '857492878101',
    projectId: 'meurango-9959d',
    storageBucket: 'meurango-9959d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8gfyB6DVUxI4Vj_OyNb_gN9OW2RblCyY',
    appId: '1:857492878101:ios:302a5932c4fb8e8655af1c',
    messagingSenderId: '857492878101',
    projectId: 'meurango-9959d',
    storageBucket: 'meurango-9959d.firebasestorage.app',
    iosBundleId: 'com.ruybarbosa.meurango',
  );
}
