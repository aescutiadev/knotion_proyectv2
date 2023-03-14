import 'dart:io';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewControllerPage extends GetxController {
  final url = 'https://www.google.com'.obs;

  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    loadUrl(Get.arguments);
  }

  void loadUrl(String newUrl) {
    url.value = newUrl;
    update();
  }
}
