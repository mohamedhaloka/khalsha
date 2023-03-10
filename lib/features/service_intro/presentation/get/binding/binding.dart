import 'package:get/get.dart';

import '../controllers/controller.dart';

class ServiceIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceIntroController>(() => ServiceIntroController());
  }
}
