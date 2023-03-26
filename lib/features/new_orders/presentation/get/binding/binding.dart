import 'package:get/get.dart';

import '../controllers/controller.dart';

class NewOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewOrdersController>(() => NewOrdersController());
  }
}
