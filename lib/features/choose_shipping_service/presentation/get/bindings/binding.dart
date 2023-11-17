import 'package:get/get.dart';

import 'package:khalsha/features/choose_shipping_service/presentation/get/controllers/controller.dart';

class ChooseShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseShippingServiceController>(
        () => ChooseShippingServiceController());
  }
}
