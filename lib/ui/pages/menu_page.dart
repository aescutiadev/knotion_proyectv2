import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secciones'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          cardWidget(
            onTap: () {
              Get.toNamed('/clima');
            },
            title: 'CLIMA',
            description: 'description',
          ),
          const SizedBox(height: 10),
          cardWidget(
            onTap: () {
              Get.toNamed('/home');
            },
            title: 'LISTADO DE SERIES',
            description: 'description',
          ),
          const SizedBox(height: 10),
          cardWidget(
            onTap: () {
              Get.toNamed('/urllancher');
            },
            title: 'URL LAUNCHER',
            description: 'description',
          ),
          const SizedBox(height: 10),
          cardWidget(
            onTap: () {},
            title: 'NOTIFICACIONES LOCALES',
            description: 'description',
          ),
          const SizedBox(height: 10),
          cardWidget(
            onTap: () {},
            title: 'CONGIGURACION',
            description: 'description',
          ),
        ],
      ),
    );
  }

  Widget cardWidget({
    required void Function()? onTap,
    required String title,
    required String description,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title),
                  Text(description),
                ],
              ),
            ),
          ),
        ),
      );
}
