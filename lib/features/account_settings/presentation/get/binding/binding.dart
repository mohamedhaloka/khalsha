import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import 'package:khalsha/features/account_settings/presentation/get/controllers/controller.dart';

class AccountSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountSettingsController>(() => AccountSettingsController(
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
        ));
  }
}
