import 'package:get/get.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/serie_detail/aplication/get_serie_detail.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_class.dart';

class DetailController extends GetxController with StateMixin {
  final GetSerieDetail getSerieDetailUseCase;

  DetailController({required this.getSerieDetailUseCase});

  final serieDetail = <SerieDetail>[].obs;

  @override
  onInit() async {
    super.onInit();
    await getSerieDetail();
  }

  Future<void> getSerieDetail() async {
    change(null, status: RxStatus.loading());

    final result = await getSerieDetailUseCase(Get.arguments);

    result.fold((Failure l) => change(null, status: RxStatus.error(l.message)),
        (SerieDetail r) {
      serieDetail.value = [r];
      change(null, status: RxStatus.success());
    });
  }
}
