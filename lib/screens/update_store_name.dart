import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/store_controller.dart';
import '../widgets/rounded_input.dart';

class UpdateStoreName extends StatelessWidget {
  UpdateStoreName({Key? key}) : super(key: key);
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("更新商店名称")),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "输入商店名称",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 16),
            RoundedInput(
              hintText: "商店名称",
              controller: storeController.storeNameEditingController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                storeController.updateStoreName(
                    storeController.storeNameEditingController.text);
                Get.snackbar(
                    '更新',
                    '商店名称更新为\n '
                        '${storeController.storeNameEditingController.text}',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '更新',
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
