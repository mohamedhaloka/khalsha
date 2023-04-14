import 'package:get/get.dart';

import '../controllers/controller.dart';

class PersonalDomesticLandShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalDomesticLandShippingServiceController>(
        () => PersonalDomesticLandShippingServiceController());
  }
}
