import 'package:get/get.dart';

import 'package:khalsha/injection_container.dart';
import 'package:khalsha/features/sources/presentation/get/controllers/controller.dart';

class SourcesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SourcesController>(() => SourcesController(
          InjectionContainer.sl(),
          InjectionContainer.sl(),
        ));
  }
}
