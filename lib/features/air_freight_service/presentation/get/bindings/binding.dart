part of '../../../air_freight_service.dart';

class AddEditAirFreightServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditAirFreightServiceController>(
      () => AddEditAirFreightServiceController(
        InjectionContainer.sl(),
        InjectionContainer.sl(),
        InjectionContainer.sl(),
        InjectionContainer.sl(),
      ),
    );
  }
}
