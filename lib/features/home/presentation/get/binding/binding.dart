import 'package:get/get.dart';

import 'package:khalsha/features/home/presentation/get/controllers/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
