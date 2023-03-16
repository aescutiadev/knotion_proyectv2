import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = Get.isDarkMode;
  }

  void switchTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    isDarkMode.toggle();
  }
}
