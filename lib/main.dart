import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_project2/ui/routes.dart';
import 'package:test_project2/ui/themes/general_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await deleteDatabase('usersdatabase.db');
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
      themeMode:
          _themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      getPages: routes(),
    );
  }
}
