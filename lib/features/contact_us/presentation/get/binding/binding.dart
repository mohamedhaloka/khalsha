import 'package:get/get.dart';

import '../controllers/controller.dart';

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(() => ContactUsController());
  }
}
