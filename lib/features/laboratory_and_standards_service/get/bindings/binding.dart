import 'package:get/get.dart';

import '../controllers/controller.dart';

class AddEditLaboratoryAndStandardsServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditLaboratoryAndStandardsServiceController>(
        () => AddEditLaboratoryAndStandardsServiceController());
  }
}
