import 'package:get/get.dart';

import 'package:khalsha/injection_container.dart';
import 'package:khalsha/features/map/presentation/getx/controllers/controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController(
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
        ));
  }
}
