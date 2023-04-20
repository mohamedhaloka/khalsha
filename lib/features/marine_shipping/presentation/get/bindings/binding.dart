part of '../../../marine_shipping.dart';

class AddEditMarineShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditMarineShippingServiceController>(
        () => AddEditMarineShippingServiceController(
              InjectionContainer.sl(),
              InjectionContainer.sl(),
            ));
  }
}
