import 'package:flutter/material.dart';
import 'package:flutter_get_followers_shop/controllers/store_controller.dart';
import 'package:flutter_get_followers_shop/controllers/theme_controller.dart';
import 'package:flutter_get_followers_shop/widgets/card_main.dart';
import 'package:flutter_get_followers_shop/widgets/side_drawer.dart';
import 'package:get/get.dart';

import 'app_theme.dart';
import 'constants/color_constants.dart';

class Home extends GetView<StoreController> {
  Home({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceCadet,
      appBar: AppBar(
        title: const Text("小小花店"),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                // Get.snackbar('提示','白天模式');
                // Get.defaultDialog(title: "白天模式");
                themeController.changeTheme(Themes.lightTheme);
                themeController.saveTheme(false);
                //Odx方法
                //themeController.colorStatus(false);
                //GetBuilder
                themeController.colorChange1(false);
                //路由刷新界面（不推荐）
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (BuildContext context) => Home()),
                // );
                print("----界面刷新");
              } else {
                // Get.snackbar('提示','夜晚模式');
                // Get.defaultDialog(title: "夜晚模式");
                themeController.changeTheme(Themes.darkTheme);
                themeController.saveTheme(true);
                //Odx方法
                //themeController.colorStatus(true);
                //GetBuilder
                themeController.colorChange1(true);
                //路由刷新界面（不推荐）
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (BuildContext context) => Home()),
                // );
                print("----界面刷新");
              }
            },
            icon: Get.isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainCard(
                title: "商店信息",
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Store Name:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        // Wrapped with Obx to observe changes to the storeName
                        // variable when called using the StoreController.
                        Obx(
                          () => Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              // value parameter to be added with Obx or GetX
                              controller.storeName.value.toString(),
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            '花朵数量',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              const Text('Obx'),
                              Obx(
                                () => Text(
                                  controller.followerCount.value.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              const Text('GetBuilder'),
                              GetBuilder<StoreController>(
                                builder: (newController) => Text(
                                  // value parameter is not needed with GetBuilder
                                  newController.storeFollowerCount.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Wrapped with GetBuilder to observe changes to the followerCount
                        // variable when called using the StoreController.
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            '门店状态:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        // Wrapped with GetX<StoreController> to observe changes to the storeStatus
                        // variable when called using the StoreController.
                        GetX<StoreController>(
                          builder: (sController) => Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              sController.storeStatus.value ? 'Open' : 'Closed',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: sController.storeStatus.value
                                      ? Colors.green.shade700
                                      : Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //测试
              // const SizedBox(
              //   height: 20.0,
              // ),
              // Card(
              //   elevation: 5,
              //   shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(10.0),
              //           bottomRight: Radius.circular(10.0))),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: [
              //       Container(
              //         // padding: const EdgeInsets.all(10.0),
              //         child:Obx(() =>Container(
              //           color: themeController.colorStatus.value ? Colors.grey : AppColors.babyBlue,
              //           child: const Text(
              //             '1111',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 20.0,
              //                 color: AppColors.darkBlue),
              //           ),
              //         ),)
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Obx(
              //           () => ListView.builder(
              //             shrinkWrap: true,
              //             physics: const NeverScrollableScrollPhysics(),
              //             itemCount: controller.followerList.length,
              //             itemBuilder: (context, index) {
              //               return Padding(
              //                 padding: const EdgeInsets.all(8),
              //                 child: Text(
              //                   controller.followerList[index].toString(),
              //                   style: const TextStyle(fontSize: 16),
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //       const Divider(height: 1),
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Obx(
              //               () => ListView.builder(
              //             shrinkWrap: true,
              //             physics: const NeverScrollableScrollPhysics(),
              //             itemCount: controller.followerList.length,
              //             itemBuilder: (context, index) {
              //               return Padding(
              //                 padding: const EdgeInsets.all(8),
              //                 child: Text(
              //                   controller.followerList[index].toString(),
              //                   style: const TextStyle(fontSize: 16),
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20.0,
              ),
              MainCard(
                  title: "花朵名称",
                  body: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.followerList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            controller.followerList[index].toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    ),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              MainCard(
                  title: "评论区",
                  body: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.reviews.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.reviews[index].name),
                          subtitle: Text(controller.reviews[index].review),
                        );
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
