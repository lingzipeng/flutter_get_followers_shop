import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  //初始界面白天模式
  final colorStatus = false.obs;

  void colorChange(bool color) {
    colorStatus(color);
  }

  //方式二、初始界面白天模式
  bool colorStatus1 = false;

  void colorChange1(x) {
    colorStatus1 = x;
    update();
  }

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => _box.read(_key) ?? false;

  void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);

  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);

}