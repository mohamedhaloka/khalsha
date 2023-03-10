import 'package:get/get.dart';

import '../controllers/controller.dart';

class OTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(() => OTPController());
  }
}
