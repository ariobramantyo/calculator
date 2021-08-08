import 'package:calculator/controller/theme.dart';
import 'package:calculator/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final theme = Get.put(ThemesController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Calculator App',
      themeMode: ThemeMode.light,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      home: HomeScreen(),
    );
  }
}
