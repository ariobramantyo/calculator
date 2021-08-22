import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemesController extends GetxController {
  var isDarkTheme = Get.isDarkMode.obs;
  var themeApp = ThemeMode.light.obs;

  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    buttonColor: Colors.grey[300],
    primaryColor: Colors.green[800],
  );

  final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    buttonColor: Colors.grey[850],
    primaryColor: Colors.green,
  );

  void changeTheme() {
    final box = GetStorage();

    if (isDarkTheme.value) {
      Get.changeThemeMode(ThemeMode.light);
      isDarkTheme.value = false;
      themeApp.value = ThemeMode.light;
      box.write('darkMode', false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      isDarkTheme.value = true;
      themeApp.value = ThemeMode.dark;
      box.write('darkMode', true);
    }
  }

  void firstInit() {
    final box = GetStorage();
    if (box.read('darkMode') != null) {
      if (box.read('darkMode')) {
        isDarkTheme.value = true;
        themeApp.value = ThemeMode.dark;
      } else {
        isDarkTheme.value = false;
        themeApp.value = ThemeMode.light;
      }
    }
  }

  @override
  void onInit() {
    firstInit();
    super.onInit();
  }
}
