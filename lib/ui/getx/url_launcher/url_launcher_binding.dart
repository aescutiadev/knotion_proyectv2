import 'package:get/get.dart';
import 'package:test_project2/src/url_launcher/aplication/get_all_urls_usecase.dart';
import 'package:test_project2/src/url_launcher/aplication/save_url_usecase.dart';
import 'package:test_project2/src/url_launcher/infraestructure/sqflite_url_repository.dart';
import 'package:test_project2/ui/getx/url_launcher/url_launcher_controller.dart';

class UrlLauncherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UrlLauncherController(
        registerUseCase: Get.find(),
        getAllUrlsUseCase: Get.find(),
      ),
    );
    Get.lazyPut(() => UrlSaveUseCase(urlRepository: Get.find()));
    Get.lazyPut(() => SqFliteUrlRepository(client: Get.find()));

    Get.lazyPut(() => GetAllUrlsUseCase(urlRepository: Get.find()));
  }
}
