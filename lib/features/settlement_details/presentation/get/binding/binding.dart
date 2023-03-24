import 'package:get/get.dart';

import '../controllers/controller.dart';

class SettlementDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettlementDetailsController>(
        () => SettlementDetailsController());
  }
}
