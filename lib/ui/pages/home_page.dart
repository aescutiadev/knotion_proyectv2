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
        (state) => ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount:
              controller.items.length > 100 ? 100 : controller.items.length,
          itemBuilder: (BuildContext c, int i) {
            return Card(
              elevation: 10,
              color: Colors.white,
              child: ListTile(
                leading: Image.network(
                  controller.items[i].image.iconUrl.toString(),
                ),
                title: Text('${controller.items[i].name}'),
                subtitle: Text('${controller.items[i].id}'),
                trailing: Text('${controller.items[i].countOfEpisodes}'),
                onTap: () {
                  Get.toNamed(
                    '/detail',
                    arguments: controller.items[i].apiDetailUrl,
                  );
                },
              ),
            );
            /**
           * 
          return ListTile(
            leading: Text(series[i]['image']),
            title: Text('${series[i]['id']}: ${series[i]['nombre']}'),
            trailing: Text('${series[i]['count']}'),
            onTap: () {},
          );
           */
          },
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
