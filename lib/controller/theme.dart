import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemesController extends GetxController {
  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    buttonColor: Colors.grey[300],
    primaryColor: Colors.green[800],
    textTheme: TextTheme(),
  );

  final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    buttonColor: Colors.grey[850],
    primaryColor: Colors.green,
  );

  void changeTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    update();
  }
}
