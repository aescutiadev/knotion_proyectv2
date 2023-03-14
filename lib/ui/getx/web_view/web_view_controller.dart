import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewControllerPage extends GetxController {
  var isLoading = true.obs;
  var url = ''.obs;
  final WebViewController webViewController;

  WebViewControllerPage({required this.webViewController});

  @override
  void onInit() {
    super.onInit();
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            loadPage();
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://flutter.dev')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(Get.arguments));
  }

  Future<void> loadPage() async {
    isLoading.value = true;
    await Future.delayed(
        const Duration(seconds: 1)); // Solo para simular una carga
    isLoading.value = false;
  }
}
