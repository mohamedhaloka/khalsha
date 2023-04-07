import 'package:get/get.dart';

import '../controllers/controller.dart';

class AddEditAirFreightServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditAirFreightServiceController>(
      () => AddEditAirFreightServiceController(),
    );
  }
}
