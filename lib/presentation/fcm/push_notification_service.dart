import 'package:firebase_messaging/firebase_messaging.dart';

import '../../common/helpers/logging_helper.dart';

class PushNotificationService {
  final FirebaseMessaging _messaging;

  PushNotificationService(this._messaging) {
    init();
  }

  Future<void> init() async {
    await _messaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugLog('Foreground message: ${message.notification?.title}');
    });

    // Handle background/tapped messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugLog('App opened by message: ${message.data}');
    });

    // Background handler must be a top-level function
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<String?> getDeviceToken() async {
    return await _messaging.getToken();
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugLog("Background message: ${message.messageId}");
}
