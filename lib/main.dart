import 'package:flutter/material.dart';
import 'package:flutter_get_followers_shop/screens/add_follower_count.dart';
import 'package:flutter_get_followers_shop/screens/add_followers.dart';
import 'package:flutter_get_followers_shop/screens/add_reviews.dart';
import 'package:flutter_get_followers_shop/screens/store_status.dart';
import 'package:flutter_get_followers_shop/screens/update_store_name.dart';
import 'package:flutter_get_followers_shop/services/storage_service.dart';
import 'package:flutter_get_followers_shop/store_binding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_theme.dart';
import 'controllers/theme_controller.dart';
import 'home.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: StoreBinding(),
      title: 'followers shop',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
        ),
        GetPage(name: '/edit_name', page: () => UpdateStoreName()),
        GetPage(name: '/add_followers', page: () => AddFollowers()),
        GetPage(name: '/toggle_status', page: () => StoreStatus()),
        GetPage(name: '/edit_follower_count', page: () => AddFollowerCount()),
        GetPage(name: '/add_reviews', page: () => AddReviews()),
      ],
      home: Home(),
    );
  }
}

