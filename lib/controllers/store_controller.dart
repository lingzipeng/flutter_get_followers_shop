import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/reviews.dart';
import '../services/repository.dart';

class StoreController extends GetxController {
  ReviewRepository repository;
  StoreController({required this.repository});

  final storeName = '小小花店'.obs;
  final followerCount = 0.obs;
  final storeStatus = true.obs;
  final followerList = [].obs;
  final reviews = <StoreReviews>[].obs;
  final storeNameEditingController = TextEditingController();
  final reviewEditingController = TextEditingController();
  final followerController = TextEditingController();
  final reviewNameController = TextEditingController();
  int storeFollowerCount = 0;
  static StoreController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    reviews.assignAll(repository.readReviews());
    ever(reviews, (_) => repository.writeReviews(reviews));
  }

  void incrementStoreFollowers() {
    storeFollowerCount++;
    update();
  }

  updateStoreName(String name) {
    storeName(name);
  }

  updateFollowerCount() {
    followerCount(followerCount.value + 1);
  }

  void storeStatusOpen(bool isOpen) {
    storeStatus(isOpen);
  }

  updateFollowerList(List<String> list) {
    followerList.assignAll(list);
  }

  addNewFollower(String name) {
    followerList.add(name);
  }

  void addReview(StoreReviews storeReviews) {
    reviews.add(storeReviews);
  }

  // void toggleTheme() {
  //   isDarkMode.value = !isDarkMode.value;
  // }

  @override
  void dispose() {
    storeNameEditingController.dispose();
    reviewEditingController.dispose();
    super.dispose();
  }
}
