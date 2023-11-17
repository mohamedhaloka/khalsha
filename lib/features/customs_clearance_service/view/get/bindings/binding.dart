import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import 'package:khalsha/features/customs_clearance_service/customs_clearance.dart';

class AddEditCustomsClearanceServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditCustomsClearanceController>(
        () => AddEditCustomsClearanceController(
              InjectionContainer.sl(),
              InjectionContainer.sl(),
              InjectionContainer.sl(),
              InjectionContainer.sl(),
              InjectionContainer.sl(),
              InjectionContainer.sl(),
            ));
  }
}
