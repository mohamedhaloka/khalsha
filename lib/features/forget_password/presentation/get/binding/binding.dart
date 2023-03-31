import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import '../controllers/controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController(
          InjectionContainer.sl(),
        ));
  }
}
