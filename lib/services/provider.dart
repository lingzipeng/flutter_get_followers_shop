import 'dart:convert';

import 'package:flutter_get_followers_shop/services/storage_service.dart';
import 'package:get/get.dart';

import '../constants/keys.dart';
import '../models/reviews.dart';
class StoreProvider {
  final StorageService _storageService = Get.find<StorageService>();

  List<StoreReviews> readReviews() {
    var reviews = <StoreReviews>[];
    jsonDecode(_storageService.read(reviewsKey).toString())
        .forEach((e) => reviews.add(StoreReviews.fromJson(e)));
    return reviews;
  }

  void writeReview(List<StoreReviews> reviews) {
    _storageService.write(reviewsKey, jsonEncode(reviews));
  }
}