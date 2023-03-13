import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/serie/aplication/get_series.dart';
import 'package:test_project2/src/serie/domain/serie_class.dart';

/// Obtener la lista de las series en la API
class HomeController extends GetxController with StateMixin {
  final GetSeries getSeries;

  HomeController({required this.getSeries});

  final items = <Serie>[].obs;
  final scrollController = ScrollController().obs;
  final limit = 20.obs;
  final offset = 0.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    scrollController.value.addListener(() async {
      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        print('llego al final');
        print(limit);
        print(isLoading);
        print(offset);
      }
    });
    await getAllSerie();
    super.onInit();
  }

  Future<void> getAllSerie() async {

    final result = await getSeries(limit: limit.value, offset: offset.value);

    result.fold(
      (Failure l) => change(null, status: RxStatus.error(l.message)),
      (List<Serie> r) {
        if (r.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          items.addAll(r);
          Future.delayed(const Duration(seconds: 2)).whenComplete(() {
            isLoading.value = false;
            change(null, status: RxStatus.success());
          });
        }
      },
    );
  }

  void isLoadingValue() {
    isLoading.value = true;
    change(null, status: RxStatus.success());
  }
}
