import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import 'package:khalsha/features/contact_us/presentation/get/controllers/controller.dart';

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(
        () => ContactUsController(InjectionContainer.sl()));
  }
}
