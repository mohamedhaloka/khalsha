import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/add_edit_service_controller.dart';
import 'package:khalsha/features/fill_service_details/presentation/views/land_shipping/get/controllers/controller.dart';

class AddEditLandShippingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditLandShippingServiceController>(
        () => AddEditLandShippingServiceController());
    Get.lazyPut<AddEditServiceController>(() => AddEditServiceController());
  }
}
