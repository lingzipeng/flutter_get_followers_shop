import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/store_controller.dart';
import '../widgets/rounded_input.dart';


class AddFollowers extends StatelessWidget {
  AddFollowers({Key? key}) : super(key: key);
  //final storeController = Get.put(StoreController());
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("加入新花朵")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedInput(
              hintText: "花朵名称",
              controller: storeController.followerController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                storeController
                    .addNewFollower(storeController.followerController.text);
                Get.snackbar(
                    '添加花朵',
                    '新添加的花朵为\n '
                        '${storeController.followerController.text}',
                    snackPosition: SnackPosition.BOTTOM);
                storeController.followerController.clear();
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '添加',
                  style: TextStyle(fontSize: 20.0,color:Colors.black),
                ),
              ),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: storeController.followerList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(storeController.followerList[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
