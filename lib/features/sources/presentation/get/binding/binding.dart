import 'package:get/get.dart';

import '../../../../../injection_container.dart';
import '../controllers/controller.dart';

class SourcesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SourcesController>(() => SourcesController(
          InjectionContainer.sl(),
          InjectionContainer.sl(),
        ));
  }
}
