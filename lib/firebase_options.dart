import 'package:firebase_core/firebase_core.dart';

/// Configuration used for receiving notifications on Android.
///
/// This set of options is used for receiving notifications
/// through the Zulip notification bouncer service:
///   https://zulip.readthedocs.io/en/latest/production/mobile-push-notifications.html
///
/// These values represent public identifiers for that service
/// as an application registered with the relevant Google service:
/// we deliver Android notifications through Firebase Cloud Messaging (FCM).
/// The values are derived from a `google-services.json` file.
/// For details, see:
///   https://developers.google.com/android/guides/google-services-plugin#processing_the_json_file
const kFirebaseOptionsAndroid = FirebaseOptions(
  // This `appId` and `messagingSenderId` are the same as in zulip-mobile;
  // see zulip-mobile:android/app/src/main/res/values/firebase.xml .
  appId: _ZulipFirebaseOptions.appId,
  messagingSenderId: _ZulipFirebaseOptions.projectNumber,
  projectId: _ZulipFirebaseOptions.projectId,
  apiKey: _ZulipFirebaseOptions.firebaseApiKey,
);

/// Configuration used for finding the notification token on iOS.
///
/// On iOS, we don't use Firebase to actually deliver notifications;
/// rather the Zulip notification bouncer service communicates with
/// the Apple Push Notification service (APNs) directly.
///
/// But we do use the Firebase library as a convenient binding to the
/// platform API for the setup steps of requesting the user's permission
/// to show notifications, and getting the token that the service uses
/// to represent that permission.
/// These values are similar to [kFirebaseOptionsAndroid] but are for iOS,
/// and they let us initialize the Firebase library so that we can do that.
///
/// TODO: Cut out Firebase for APNs and use a thinner platform-API binding.
const kFirebaseOptionsIos = FirebaseOptions(
  appId: _ZulipFirebaseOptions.appId,
  messagingSenderId: _ZulipFirebaseOptions.projectNumber,
  projectId: _ZulipFirebaseOptions.projectId,
  apiKey: _ZulipFirebaseOptions.firebaseApiKey,
);

abstract class _ZulipFirebaseOptions {
  static const appId = 'APP_ID';
  static const projectNumber = 'SENDERID';
  static const projectId = 'zulip-mygento';
  static const firebaseApiKey = 'APIKEY';
}