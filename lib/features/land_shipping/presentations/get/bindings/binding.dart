part of '../../../land_shipping.dart';

class AddEditLandShippingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditLandShippingServiceController>(
      () => AddEditLandShippingServiceController(
        InjectionContainer.sl(),
        InjectionContainer.sl(),
        InjectionContainer.sl(),
        InjectionContainer.sl(),
      ),
    );
  }
}
