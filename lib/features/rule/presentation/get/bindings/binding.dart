import 'package:get/get.dart';

import 'package:khalsha/injection_container.dart';
import 'package:khalsha/features/rule/presentation/get/controllers/controller.dart';

class RuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RuleController>(() => RuleController(
          InjectionContainer.sl(),
        ));
  }
}
