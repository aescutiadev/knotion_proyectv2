import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/getx/detail/detail_controller.dart';

class DetailPage extends GetWidget<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serie detalle'),
      ),
      body: controller.obx(
        (state) => ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Hero(
                placeholderBuilder: (context, heroSize, child) {
                  return child;
                },
                tag: controller.serieDetail[0].apiDetailUrl.toString(),
                child: imageNetwork(
                  controller.serieDetail[0].image!.originalUrl.toString(),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Html(
                data: controller.serieDetail[0].description,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: const Center(child: Text('Lista de episodios')),
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: controller.serieDetail[0].episodes!
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 5,
                                child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Get.toNamed(
                                        '/detail/serie',
                                        arguments: e.siteDetailUrl,
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${e.id}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '${e.name}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList()),
              ),
            ),
          ],
        ),
        onEmpty: const Center(child: Text('No hay datos')),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(
          child: Text(error.toString()),
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
