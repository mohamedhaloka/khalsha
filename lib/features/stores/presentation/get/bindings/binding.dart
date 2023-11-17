import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import 'package:khalsha/features/stores/stores.dart';

class AddEditStoresServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditStoresServiceController>(
        () => AddEditStoresServiceController(
              InjectionContainer.sl(),
              InjectionContainer.sl(),
              InjectionContainer.sl(),
            ));
  }
}
