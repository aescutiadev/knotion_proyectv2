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
      body: ListView(
        children: [
          Image.network(
            controller.serieDetail[0].image!.originalUrl.toString(),
          ),
          Text(controller.serieDetail[0].name.toString()),
        ],
      ),
    );
  }
}
