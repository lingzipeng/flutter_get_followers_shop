# flutter_get_followers_shop

A new Flutter project.

## Getting Started

弄一个简单的界面测试getx

### 使用的pub

```
get: ^4.6.1
get_storage: ^2.0.3
equatable: ^2.0.3
```

### 基础设置

#### 颜色

```
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Dark Theme colors
  static const Color darkGrey = Color(0xff303041);
  static const Color lightGrey = Color(0xFF3D3A50);
  static const Color white = Color(0xFF0EA2F6);
  static const Color burgundy = Color(0xFF880d1e);
  static const Color spaceCadet = Color(0xFFF4FCFE);

  // Light Theme Colors
  static const Color blue = Color(0xFF50B1EA);
  static const Color babyPink = Color(0xFFFECEE9);
  static const Color lavender = Color(0xFFEB9FEF);
  static const Color gunMetal = Color(0xFF545677);
  static const Color spaceBlue = Color(0xFF03254E);
  static const Color darkBlue = Color(0xFF011C27);
}
```

#### 对象结构

```
class Food {
  String id;
  String name;
  int calories;
  double price;

  Food({
    required this.id,
    required this.name,
    required this.calories,
    required this.price,
  });
}
```

```
import 'package:equatable/equatable.dart';

class StoreReviews extends Equatable {
  final String name;
  final String review;

  const StoreReviews({required this.name, required this.review});

  StoreReviews copyWith({
    String? name,
    String? review,
  }) =>
      StoreReviews(
        name: name ?? this.name,
        review: review ?? this.review,
      );

  factory StoreReviews.fromJson(Map<String, dynamic> json) => StoreReviews(
    name: json['name'],
    review: json['review'],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [name, review];
}
```

#### 主题设置

```
class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.spaceCadet,
      onPrimary: Colors.black,
      secondary: AppColors.spaceBlue,
      onSecondary: AppColors.spaceCadet,
      background: AppColors.blue,
    ),
  );

  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: AppColors.spaceBlue,
        secondary: AppColors.burgundy,
        onSecondary: AppColors.spaceCadet,
        background: AppColors.spaceCadet,
      ));
}
```



#### 状态管理

方式一：

Obx是GetX库中最简单和方便的状态管理方式之一，它主要用于监听Observable类型的变量并根据其变化来更新UI。

```
//初始界面白天模式
final colorStatus = false.obs;

  void colorChange(bool color) {
    colorStatus(color);
  }

```

```
//Odx方法
themeController.colorStatus(false);
```

```
Obx(
            () => Container(
              padding: const EdgeInsets.all(10.0),
              color: themeController.colorStatus.value ? Colors.grey : AppColors.babyBlue,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppColors.darkBlue),
              ),
            ),
          ),
```

方式二：

GetBuilder是另一种常用的GetX状态管理方式，它通过builder函数来构建UI，可以在builder函数中直接访问控制器中的变量和方法。

```
//方式二、初始界面白天模式
  bool colorStatus1 = false;

  void colorChange1(x) {
    colorStatus1 = x;
    update();
  }
```

```
//GetBuilder
themeController.colorChange1(true);
```

```
GetBuilder<ThemeController>(
            builder: (newController) => Container(
              padding: const EdgeInsets.all(10.0),
              color: newController.colorStatus1 ? Colors.grey : AppColors.babyBlue,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppColors.darkBlue),
              ),
            ),
          ),
```

Obx适合用于监听Observable类型的变量，而GetBuilder适合用于直接访问控制器中的变量和方法，并根据需要更新UI。

#### 路由管理

定义了应用程序的所有页面路由，每个页面路由由一个GetPage对象表示。

```
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
```

```
//页面的跳转，并在跳转后关闭之前的所有页面
Get.offAndToNamed('/edit_name');
```

