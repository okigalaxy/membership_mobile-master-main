import 'package:get/get.dart';

import '../controllers/list_reward_controller.dart';

class ListRewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListRewardController>(
      () => ListRewardController(),
    );
  }
}
