import 'package:get/get.dart';

import '../controllers/controller.dart';

class AddEditStoresServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditStoresServiceController>(
        () => AddEditStoresServiceController());
  }
}
