import 'package:get/get.dart';

import '../../../../../injection_container.dart';
import '../controllers/controller.dart';

class AddPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPhoneNumberController>(
      () => AddPhoneNumberController(
        InjectionContainer.sl(),
      ),
    );
  }
}
