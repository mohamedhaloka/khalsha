import 'package:get/get.dart';

import '../../../../../injection_container.dart';
import '../controllers/controller.dart';

class RuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RuleController>(() => RuleController(
          InjectionContainer.sl(),
        ));
  }
}
