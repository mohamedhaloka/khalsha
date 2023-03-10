import 'package:get/get.dart';

import '../controllers/controller.dart';

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>(() => BlogController());
  }
}
