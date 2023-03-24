import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/fill_data_controller.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/fill_service_details_controller.dart';

import '../controllers/additional_service_step_controller.dart';
import '../controllers/pick_locations_step_controller.dart';

class FillServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FillServiceDetailsController>(
      () => FillServiceDetailsController(),
    );

    Get.lazyPut<FillDataController>(
      () => FillDataController(),
    );
    Get.lazyPut<AdditionalServiceStepController>(
      () => AdditionalServiceStepController(),
    );
    Get.lazyPut<PickLocationsStepController>(
      () => PickLocationsStepController(),
    );
  }
}
