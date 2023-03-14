import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_project2/src/serie/aplication/get_series.dart';
import 'package:test_project2/src/serie/domain/serie_repository.dart';
import 'package:test_project2/src/serie/infraestructure/http_serie_repository.dart';
import 'package:test_project2/ui/getx/home/home_controller.dart';
import 'package:test_project2/ui/themes/general_theme.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(getSeries: Get.find()));
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => GetSeries(serieRepository: Get.find()));
    Get.lazyPut(() => http.Client());
    Get.lazyPut<SerieRepository>(() => HttpSerieRepository(client: Get.find()));
  }
}
