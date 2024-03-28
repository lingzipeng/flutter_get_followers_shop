import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/store_controller.dart';
import '../models/reviews.dart';
import '../widgets/rounded_input.dart';


class AddReviews extends StatelessWidget {
  AddReviews({Key? key}) : super(key: key);
  //final storeController = Get.put(StoreController());
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("评论区")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedInput(
              hintText: "昵称",
              controller: storeController.reviewNameController,
            ),
            const SizedBox(height: 16),
            RoundedInput(
              hintText: "评论",
              controller: storeController.reviewEditingController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var reviews = StoreReviews(
                    name: storeController.reviewNameController.text,
                    review: storeController.reviewEditingController.text);
                storeController.addReview(reviews);
                Get.snackbar(
                    '评论',
                    '添加的新评论为:\n'
                        '${storeController.reviewNameController.text}',
                    snackPosition: SnackPosition.BOTTOM);
                storeController.reviewNameController.clear();
                storeController.reviewEditingController.clear();
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '评论添加',
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                ),
              ),
            ),
            Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: storeController.reviews.length,
                  itemBuilder: (context, index) {
                    List<StoreReviews> storeReviews = storeController.reviews
                        .map((element) => StoreReviews(
                            name: element.name, review: element.review))
                        .toList();
                    return ListTile(
                      title: Text(storeReviews[index].name),
                      subtitle: Text(storeReviews[index].review),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
