import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/routes.dart';
import 'package:test_project2/ui/themes/general_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = GeneralThemeApp();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: theme.themeDataLight(),
      initialRoute: '/',
      getPages: routes(),
    );
  }
}
