import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/getx/notifications/notifications_controller.dart';

class NotificationsPage extends GetView<NotificationController> {
   
   const NotificationsPage({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await controller.showNotification(
              title: 'My Notification',
              body: 'This is a notification from My App',
            );
          },
          child: const Text('Show Notification'),
        ),
      ),
    );
  }
}