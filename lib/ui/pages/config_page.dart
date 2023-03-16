import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/themes/general_theme.dart';

class ConfigPage extends StatelessWidget {
  ConfigPage({Key? key}) : super(key: key);

  final theme = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'),
      ),
      body: Obx(
        () => Column(
          children: [
            Card(
              child: SwitchListTile(
                value: theme.isDarkMode.value,
                onChanged: (value) => theme.switchTheme(value),
                title: Row(
                  children: [
                    SizedBox(
                        width: 50,
                        child: theme.isDarkMode.value
                            ? const Icon(Icons.dark_mode)
                            : const Icon(Icons.sunny)),
                    Flexible(
                        child: theme.isDarkMode.value
                            ? const Text('Cambiar tema a claro')
                            : const Text('Cambiar tema a oscuro'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
