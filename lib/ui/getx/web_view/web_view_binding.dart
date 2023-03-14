import 'package:get/get.dart';
import 'package:test_project2/ui/getx/web_view/web_view_controller.dart';

class WebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewControllerPage>(
      () => WebViewControllerPage(webViewController: Get.find()),
    );
  }
}
