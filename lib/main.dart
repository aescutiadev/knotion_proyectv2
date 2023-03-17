import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_project2/ui/routes.dart';
import 'package:test_project2/ui/themes/general_theme.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await openDatabase(
    'usersdatabase.db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL,
          pass TEXT NOT NULL,
          status TEXT NOT NULL
        )''');
      await db.execute('''
        CREATE TABLE IF NOT EXISTS url (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL
        )''');
    },
  );
  Get.put<Database>(db);
  Get.put<ThemeController>(ThemeController());
  await GetStorage.init();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme:
            controller.isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
        initialRoute: GetStorage().hasData('session') ? '/menu' : '/',
        getPages: routes(),
      ),
    );
  }
}
