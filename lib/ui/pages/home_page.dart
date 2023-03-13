import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/getx/home/home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de series'),
      ),
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            controller: controller.scrollController.value,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Card(
                    elevation: 1,
                    color: Colors.white,
                    child: ListTile(
                      leading: Hero(
                        tag: controller.items[i].apiDetailUrl.toString(),
                        child: Image.network(
                          controller.items[i].image.iconUrl.toString(),
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
                      title: Text('${controller.items[i].name}'),
                      subtitle: Text(
                        'Número de episodios ${controller.items[i].countOfEpisodes}',
                      ),
                      trailing: Text('${i + 1}'),
                      onTap: () {
                        Get.toNamed(
                          '/detail',
                          arguments: controller.items[i].apiDetailUrl,
                        );
                      },
                    ),
                  ),
                  childCount: controller.items.length,
                ),
              ),
              SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: () {
                    controller.isLoadingValue();
                    controller.offset.value =
                        controller.offset.value + controller.limit.value;
                    controller.getAllSerie();
                  },
                  child: controller.isLoading.value
                      ? const Text('Cargando...')
                      : const Text('VER MAS'),
                ),
              ),
            ],
          ),
        ),
        onError: (error) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onEmpty: const Center(
          child: Text('No hay datos'),
        ),
      ),
    );
  }
}
