import 'package:get/get.dart';
import 'package:khalsha/features/on_boarding/presentation/get/controllers/controller.dart';

class OnBoardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}
