import 'package:get/get.dart';

import '../controllers/controller.dart';

class InternationalPrivateTransferLandShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternationalPrivateTransferLandShippingServiceController>(
        () => InternationalPrivateTransferLandShippingServiceController());
  }
}
