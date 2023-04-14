import 'package:get/get.dart';

import '../controllers/controller.dart';

class ChooseShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseShippingServiceController>(
        () => ChooseShippingServiceController());
  }
}
