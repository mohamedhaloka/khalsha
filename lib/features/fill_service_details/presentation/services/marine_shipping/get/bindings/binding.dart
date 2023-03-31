import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/add_edit_service_controller.dart';
import 'package:khalsha/features/fill_service_details/presentation/services/marine_shipping/get/controllers/controller.dart';

class AddEditMarineShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditMarineShippingServiceController>(
        () => AddEditMarineShippingServiceController());
    Get.lazyPut<AddEditServiceController>(() => AddEditServiceController());
  }
}
