import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/add_edit_service_controller.dart';

import '../controllers/controller.dart';

class AddEditAirFreightServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditAirFreightServiceController>(
      () => AddEditAirFreightServiceController(),
    );
    Get.lazyPut<AddEditServiceController>(
      () => AddEditServiceController(),
    );
  }
}
