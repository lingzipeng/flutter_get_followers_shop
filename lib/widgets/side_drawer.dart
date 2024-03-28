import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              '小小花店',
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              leading: Icon(
                Icons.change_circle_sharp,
                color:
                Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
              title: Text(
                "修改商店名称",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Get.isDarkMode
                      ? AppColors.spaceCadet
                      : AppColors.spaceBlue,
                ),
              ),
              onTap: () {
                // closes the drawer and goes to another screen
                Get.offAndToNamed('/edit_name');
                //Get.back();
              }),
          ListTile(
            leading: Icon(
              Icons.add_reaction_sharp,
              color:
              Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              "添加花朵",
              style: TextStyle(
                fontSize: 18.0,
                color:
                Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/add_followers'),
          ),
          ListTile(
            leading: Icon(
              Icons.add_task_sharp,
              color:
              Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              "花朵数量更新",
              style: TextStyle(
                fontSize: 18.0,
                color:
                Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/edit_follower_count'),
          ),
          ListTile(
            leading: Icon(
              Icons.toggle_on_sharp,
              color:
              Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              "门店状态",
              style: TextStyle(
                fontSize: 18.0,
                color:
                Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/toggle_status'),
          ),
          ListTile(
            leading: Icon(
              Icons.add_comment_sharp,
              color:
              Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              "添加评论",
              style: TextStyle(
                fontSize: 18.0,
                color:
                Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/add_reviews'),
          ),
        ],
      ),
    );
  }
}
