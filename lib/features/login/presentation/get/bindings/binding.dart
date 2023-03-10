import 'package:get/get.dart';
import 'package:khalsha/features/login/presentation/get/controllers/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
