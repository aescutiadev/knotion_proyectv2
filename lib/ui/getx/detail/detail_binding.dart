import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_project2/src/serie_detail/aplication/get_serie_detail.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_repository.dart';
import 'package:test_project2/src/serie_detail/infraestructure/http_serie_detail_reposiroty.dart';
import 'package:test_project2/ui/getx/detail/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController(getSerieDetailUseCase: Get.find()));
    Get.lazyPut(() => GetSerieDetail(serieDetailRepository: Get.find()));
    Get.lazyPut(() => http.Client());
    Get.lazyPut<SerieDetailRepository>(
        () => HttpSerieDetailRepository(client: Get.find()));
  }
}
