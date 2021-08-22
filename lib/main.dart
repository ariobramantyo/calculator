import 'package:calculator/controller/theme.dart';
import 'package:calculator/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final theme = Get.put(ThemesController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'Calculator App',
          themeMode: theme.themeApp.value,
          theme: theme.lightTheme,
          darkTheme: theme.darkTheme,
          home: HomeScreen(),
        ));
  }
}
