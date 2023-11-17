import 'package:get/get.dart';
import 'package:khalsha/features/intro/presentation/get/controllers/controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(() => IntroController());
  }
}
