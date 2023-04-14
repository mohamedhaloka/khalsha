import 'package:get/get.dart';

import '../controllers/controller.dart';

class CommercialDomesticLandShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommercialDomesticLandShippingServiceController>(
        () => CommercialDomesticLandShippingServiceController());
  }
}
