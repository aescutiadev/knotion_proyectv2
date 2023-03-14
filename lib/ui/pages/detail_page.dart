import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/getx/detail/detail_controller.dart';
import 'package:test_project2/ui/widgets/detail_card_widget.dart';
import 'package:test_project2/ui/widgets/detail_stack_widget.dart';
import 'package:test_project2/ui/widgets/message_general_widget.dart';

class DetailPage extends GetWidget<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: controller.obx(
          (state) => Text('${controller.serieDetail[0].name}'),
        ),
      ),
      body: controller.obx(
        (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            StackWidget(
              url: '${controller.serieDetail[0].siteDetailUrl}',
              imageCover: '${controller.serieDetail[0].image!.originalUrl}',
              serieName: '${controller.serieDetail[0].name}',
              serieDesc: '${controller.serieDetail[0].description}',
              year: '${controller.serieDetail[0].startYear}',
              count: '${controller.serieDetail[0].countOfEpisodes}',
              listEpisodes: Container(
                height: 200,
                margin: const EdgeInsets.only(bottom: 25, top: 20),
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.serieDetail[0].episodes != null
                      ? controller.serieDetail[0].episodes!.length
                      : 0,
                  itemBuilder: (context, index) {
                    return EpisodeCardWidget(
                      onTap: () {
                        Get.toNamed(
                          '/detail/serie',
                          arguments: controller.serieDetail[0].siteDetailUrl,
                        );
                      },
                      cover:
                          '${controller.serieDetail[0].image!.screenLargeUrl}',
                      name: controller.getEpisodeNumberFormated(
                        controller.serieDetail[0].episodes![index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        onEmpty: const Center(child: Text('No hay datos')),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MessageContainerWidget(
                  message: error.toString(),
                  type: MessageType.ERROR,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton.icon(
                  onPressed: () {
                    controller.getSerieDetail();
                  },
                  icon: const Icon(Icons.autorenew_outlined),
                  label: const Text("Try again"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Image imageNetwork(String url) => Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return SizedBox(
            width: 20,
            child: Center(
              child: LinearProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, exception, stackTrace) {
          return const Icon(Icons.error);
        },
      );
}
