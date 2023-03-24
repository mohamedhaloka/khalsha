import 'package:get/get.dart';

import '../controllers/controller.dart';

class BillDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillDetailsController>(() => BillDetailsController());
  }
}
