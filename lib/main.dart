import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/routes.dart';
import 'package:test_project2/ui/themes/general_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController _themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:  _themeController.isDarkMode.value
            ? ThemeData.dark()
            : ThemeData.light(),
      initialRoute: '/',
      getPages: routes(),
    );
  }
}
