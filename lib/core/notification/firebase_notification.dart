// lib/core/helpers/firebase_notification_helper.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationHelper {
  static Future<void> onBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('📨 Background Message: ${message.messageId}');
  }

  static Future<void> init() async {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    NotificationSettings settings = await FirebaseMessaging.instance
        .requestPermission(alert: true, badge: true, sound: true);
    print('🛡️ Notification permission: ${settings.authorizationStatus}');

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    final fcmToken = await FirebaseMessaging.instance.getToken();
    print('🔑 FCM Token: $fcmToken');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📲 Foreground message received: ${message.notification?.title}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('🚪 Notification clicked: ${message.notification?.title}');
    });
  }
}
