import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
import '../controllers/theme_controller.dart';

class MainCard extends StatelessWidget {
  final String title;
  final Widget body;
  final themeController = Get.find<ThemeController>();

  MainCard({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Obx(
          //   () =>
          //   Container(
          //     padding: const EdgeInsets.all(10.0),
          //     color: themeController.colorStatus.value ? Colors.grey : AppColors.babyBlue,
          //     child: Text(
          //       title,
          //       textAlign: TextAlign.center,
          //       style: const TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20.0,
          //           color: AppColors.darkBlue),
          //     ),
          //   ),
          // ),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: body,
          ),
        ],
      ),
    );
  }
}
