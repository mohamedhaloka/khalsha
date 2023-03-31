import 'package:get/get.dart';
import 'package:khalsha/features/login/presentation/get/controllers/controller.dart';
import 'package:khalsha/injection_container.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
          InjectionContainer.sl(),
        ));
  }
}
