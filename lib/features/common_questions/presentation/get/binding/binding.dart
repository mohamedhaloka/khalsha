import 'package:get/get.dart';

import '../controllers/controller.dart';

class CommonQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommonQuestionsController>(() => CommonQuestionsController());
  }
}
