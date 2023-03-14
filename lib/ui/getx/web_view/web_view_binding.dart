import 'package:get/get.dart';
import 'package:test_project2/ui/getx/web_view/web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewControllerPage>(() => WebViewControllerPage());
  }
}
