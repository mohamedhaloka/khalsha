import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import '../controllers/controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(
          InjectionContainer.sl(),
        ));
  }
}
