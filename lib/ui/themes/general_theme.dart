import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _themeData = GetStorage();
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _themeData.writeIfNull("darkmode", false);
    isDarkMode.value = _themeData.read("darkmode");
  }

  void switchTheme(bool value) {
    Get.changeThemeMode(
      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
    isDarkMode.value = value;
    _themeData.write('darkmode', value);
    update();
  }
}
