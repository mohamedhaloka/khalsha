import 'package:get/get.dart';

import '../controllers/controller.dart';

class InternationalBulkGoodsLandShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternationalBulkGoodsLandShippingServiceController>(
        () => InternationalBulkGoodsLandShippingServiceController());
  }
}
