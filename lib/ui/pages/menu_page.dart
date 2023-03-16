import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Bienvenido ${Get.arguments}')],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Secciones'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Table(
              children: [
                TableRow(children: <TableCell>[
                  TableCell(
                    child: cardWidget(
                      onTap: () {
                        Get.toNamed('/clima');
                      },
                      title: 'CLIMA',
                      description: 'description',
                    ),
                  ),
                  TableCell(
                    child: cardWidget(
                      onTap: () {
                        Get.toNamed('/home');
                      },
                      title: 'LISTADO DE SERIES',
                      description: 'description',
                      icon: Icons.list_alt_rounded,
                    ),
                  ),
                ]),
                TableRow(children: <TableCell>[
                  TableCell(
                    child: cardWidget(
                      onTap: () {
                        Get.toNamed('/urllancher');
                      },
                      title: 'URL LAUNCHER',
                      icon: Icons.pageview,
                      description: 'description',
                    ),
                  ),
                  TableCell(
                    child: cardWidget(
                      onTap: () {},
                      title: 'NOTIFICACIONES LOCALES',
                      icon: Icons.notifications,
                      description: 'description',
                    ),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 10),
            cardWidget(
              onTap: () {
                Get.toNamed('/config');
              },
              title: 'CONGIGURACION',
              icon: Icons.settings,
              description: 'description',
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget({
    required void Function()? onTap,
    required String title,
    required String description,
    IconData icon = Icons.sunny,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 100,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 30),
                  const SizedBox(height: 10),
                  Text(title),
                  Text(description),
                ],
              ),
            ),
          ),
        ),
      );
}
