import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import 'package:khalsha/features/forget_password/presentation/get/controllers/controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController(
          InjectionContainer.sl(),
        ));
  }
}
