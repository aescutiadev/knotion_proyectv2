import 'package:get/get.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/serie/aplication/get_series.dart';
import 'package:test_project2/src/serie/domain/serie_class.dart';

/// Obtener la lista de las series en la API
class HomeController extends GetxController with StateMixin {
  final GetSeries getSeries;

  HomeController({required this.getSeries});

  final items = <Serie>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllSerie();
  }

  Future<void> getAllSerie() async {
    change(null, status: RxStatus.loading());

    final result = await getSeries();

    result.fold(
      (Failure l) => change(null, status: RxStatus.error(l.message)),
      (List<Serie> r) {
        if (r.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          items.value = r;
          change(null, status: RxStatus.success());
        }
      },
    );
  }
}
