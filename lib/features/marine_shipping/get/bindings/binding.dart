import 'package:get/get.dart';

import '../controllers/controller.dart';

class AddEditMarineShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditMarineShippingServiceController>(
        () => AddEditMarineShippingServiceController());
  }
}
