import 'package:get/get.dart';

import '../controllers/controller.dart';

class AccountSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountSettingsController>(() => AccountSettingsController());
  }
}
