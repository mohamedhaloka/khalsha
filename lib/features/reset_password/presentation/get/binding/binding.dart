import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import 'package:khalsha/features/reset_password/presentation/get/controllers/controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController(
          InjectionContainer.sl(),
        ));
  }
}
