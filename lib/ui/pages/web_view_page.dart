import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/getx/web_view/web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends GetWidget<WebViewControllerPage> {
  const WebViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
      ),
      body: GetBuilder<WebViewControllerPage>(
        builder: (_) => WebView(
          initialUrl: controller.url.value,
        ),
      ),
    );
  }
}
