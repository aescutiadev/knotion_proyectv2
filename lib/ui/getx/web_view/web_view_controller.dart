import 'dart:io';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewControllerPage extends GetxController {
  final WebViewController webViewCtrl;
  WebViewControllerPage({required this.webViewCtrl});
  String url = 'https://www.google.com';

  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  void loadUrl(String newUrl) {
    url = newUrl;
    update();
  }
}
