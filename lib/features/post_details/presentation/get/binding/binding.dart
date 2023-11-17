import 'package:get/get.dart';

import 'package:khalsha/features/post_details/presentation/get/controllers/controller.dart';

class PostDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDetailsController>(() => PostDetailsController());
  }
}
