import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  @override
  void onInit() {
    super.onInit();
    const android = AndroidInitializationSettings('app_icon');
    const ios = DarwinInitializationSettings();
    const initializationSettings =
        InitializationSettings(android: android, iOS: ios);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin!.initialize(initializationSettings);
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const android = AndroidNotificationDetails(
      'test',
      'Test Notification',
      channelDescription: 'channel description',
      priority: Priority.high,
      importance: Importance.max,
    );

    const iOS = DarwinNotificationDetails();
    const platform = NotificationDetails(android: android, iOS: iOS);

    await flutterLocalNotificationsPlugin!.show(
      0,
      title,
      body,
      platform,
      payload: 'item x',
    );
  }
}
