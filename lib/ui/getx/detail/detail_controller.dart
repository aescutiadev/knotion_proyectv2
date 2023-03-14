import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/serie_detail/aplication/get_serie_detail.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_class.dart';

class DetailController extends GetxController with StateMixin {
  final GetSerieDetail getSerieDetailUseCase;

  DetailController({required this.getSerieDetailUseCase});

  final serieDetail = <SerieDetail>[].obs;

  final scrollVController = ScrollController().obs;
  final scrollHController = ScrollController().obs;

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

  String getEpisodeNumberFormated(episode) {
    final String episodeNumber = episode.episodeNumber;
    String seasonText = "S";
    String episodeText = "E";

    if (episodeNumber.length <= 3) {
      seasonText += episodeNumber[0];
      episodeText += episodeNumber.substring(1, episodeNumber.length);
    } else {
      seasonText += episodeNumber.substring(0, 2);
      episodeText += episodeNumber.substring(2, episodeNumber.length);
    }

    return '$seasonText - $episodeText ${episode.name}';
  }
}
