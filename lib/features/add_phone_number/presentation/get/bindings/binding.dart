import 'package:get/get.dart';

import 'package:khalsha/injection_container.dart';
import 'package:khalsha/features/add_phone_number/presentation/get/controllers/controller.dart';

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
