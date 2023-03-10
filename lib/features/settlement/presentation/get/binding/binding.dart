import 'package:get/get.dart';

import '../controllers/controller.dart';

class SettlementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettlementController>(() => SettlementController());
  }
}
