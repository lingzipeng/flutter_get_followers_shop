import 'package:flutter_get_followers_shop/services/provider.dart';
import 'package:flutter_get_followers_shop/services/repository.dart';
import 'package:get/get.dart';

import 'controllers/store_controller.dart';


class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController(
        repository: ReviewRepository(storeProvider: StoreProvider())));
  }
}