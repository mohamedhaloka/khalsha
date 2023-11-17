import 'package:get/get.dart';

import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

class ServiceIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceIntroController>(() => ServiceIntroController());
  }
}
