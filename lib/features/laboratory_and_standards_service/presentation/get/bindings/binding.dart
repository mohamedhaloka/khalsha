part of '../../../laboratory.dart';

class AddEditLaboratoryAndStandardsServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditLaboratoryAndStandardsServiceController>(
        () => AddEditLaboratoryAndStandardsServiceController(
              InjectionContainer.sl(),
              InjectionContainer.sl(),
              InjectionContainer.sl(),
              InjectionContainer.sl(),
            ));
  }
}
