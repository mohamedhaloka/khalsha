import 'package:get/get.dart';

import '../controllers/controller.dart';

class HowToUseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HowToUseController>(() => HowToUseController());
  }
}
