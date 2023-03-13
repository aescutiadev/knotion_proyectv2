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
              tag: controller.serieDetail[0].apiDetailUrl.toString(),
              child: Image.network(
                controller.serieDetail[0].image!.originalUrl.toString(),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  );
                },
                errorBuilder: (context, exception, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
            Text(controller.serieDetail[0].name.toString()),
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: controller.serieDetail[0].episodes!.length,
                itemBuilder: (context, index) {
                  var episode = controller.serieDetail[0].episodes![index];
                  return Card(
                    child: Table(
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      children: [
                        TableRow(
                          children: [
                            const TableCell(
                              child: Text('ID:'),
                            ),
                            TableCell(
                              child: Text(episode.episodeNumber.toString()),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                              child: Text('NOMBRE:'),
                            ),
                            TableCell(
                              child: Text(episode.name.toString()),
                            ),
                          ],
                        ),
                      ],
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
}
