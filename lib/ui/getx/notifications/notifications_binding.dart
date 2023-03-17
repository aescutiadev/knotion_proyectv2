import 'package:get/get.dart';
import 'package:test_project2/ui/getx/notifications/notifications_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}