import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/add_edit_service_controller.dart';

class FillServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditServiceController>(
      () => AddEditServiceController(),
    );
  }
}
