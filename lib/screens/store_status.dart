import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/store_controller.dart';


class StoreStatus extends StatelessWidget {
  StoreStatus({Key? key}) : super(key: key);
  //final storeController = Get.put(StoreController());
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("门店状态")),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "门店状态转换",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 16),
              Obx(
                () => Switch(
                  onChanged: (value) => storeController.storeStatus(value),
                  activeColor: Colors.green,
                  value: storeController.storeStatus.value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
