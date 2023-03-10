import 'package:get/get.dart';

import '../controllers/controller.dart';

class PostDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDetailsController>(() => PostDetailsController());
  }
}
