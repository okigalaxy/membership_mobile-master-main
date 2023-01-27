import 'package:get/get.dart';

import '../controllers/history_reedem_controller.dart';

class HistoryReedemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryReedemController>(
      () => HistoryReedemController(),
    );
  }
}
