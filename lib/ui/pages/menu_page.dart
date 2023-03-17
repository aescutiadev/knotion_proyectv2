import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  child: Icon(Icons.person, size: 40),
                ),
                accountName: const Text('Usuario'),
                accountEmail: Text('${Get.arguments}'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ListTile(
                textColor:
                    Theme.of(context).primaryTextTheme.titleMedium!.color,
                title: Text(
                  'Cerrar Sesión',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                leading: const Icon(Icons.exit_to_app),
                onTap: () {
                  Get.defaultDialog(
                    title: 'Confirmación',
                    content: const Text('¿Desea cerrar sesión?'),
                    onConfirm: () {
                      GetStorage().remove('session');
                      Get.offAllNamed('/');
                    },
                    onCancel: () {},
                  );
                },
              ),
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
                      onTap: () {
                        Get.toNamed('/notifications');
                      },
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
