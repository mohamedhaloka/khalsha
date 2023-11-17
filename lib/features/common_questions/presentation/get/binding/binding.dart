import 'package:get/get.dart';

import 'package:khalsha/features/common_questions/presentation/get/controllers/controller.dart';

class CommonQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommonQuestionsController>(() => CommonQuestionsController());
  }
}
