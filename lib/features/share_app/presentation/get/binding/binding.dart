import 'package:get/get.dart';

import '../controllers/controller.dart';

class ShareAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShareAppController>(() => ShareAppController());
  }
}
