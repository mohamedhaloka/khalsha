import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import '../controllers/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(
          InjectionContainer.sl(),
        ));
  }
}
