import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import '../controllers/controller.dart';

class AddEditCustomsClearanceServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditCustomsClearanceController>(
        () => AddEditCustomsClearanceController(
              InjectionContainer.sl(),
              InjectionContainer.sl(),
            ));
  }
}
