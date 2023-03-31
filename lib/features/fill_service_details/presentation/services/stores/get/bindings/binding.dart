import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/add_edit_service_controller.dart';

import '../controllers/controller.dart';

class AddEditStoresServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditStoresServiceController>(
        () => AddEditStoresServiceController());
    Get.lazyPut<AddEditServiceController>(() => AddEditServiceController());
  }
}
