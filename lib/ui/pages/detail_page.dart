import 'package:flutter/material.dart';
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
            Hero(
              placeholderBuilder: (context, heroSize, child) {
                print(heroSize);
                print(child);
                return child;
              },
              tag: controller.serieDetail[0].apiDetailUrl.toString(),
              child: imageNetwork(
                controller.serieDetail[0].image!.originalUrl.toString(),
              ),
            ),
            Text(controller.serieDetail[0].name.toString()),
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: controller.serieDetail[0].episodes!.length,
                itemBuilder: (context, index) {
                  var episode = controller.serieDetail[0].episodes![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 200,
                            color: Colors.white,
                            child: imageNetwork(controller
                                .serieDetail[0].image!.mediumUrl
                                .toString()),
                          ),
                          if (index != 0)
                            const Positioned(
                              bottom: 60,
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.navigate_before,
                                  color: Colors.amber,
                                  size: 40,
                                ),
                              ),
                            ),
                          if (index == 0 ||
                              index <
                                  controller.serieDetail[0].episodes!.length)
                            const Positioned(
                              bottom: 60,
                              right: 1,
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.navigate_next,
                                  color: Colors.amber,
                                  size: 40,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ); // imagen del carrusel
                },
              ),
            )
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
