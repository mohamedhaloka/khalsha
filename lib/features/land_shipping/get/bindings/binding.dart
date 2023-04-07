import 'package:get/get.dart';

import '../controllers/controller.dart';

class AddEditLandShippingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditLandShippingServiceController>(
        () => AddEditLandShippingServiceController());
  }
}
