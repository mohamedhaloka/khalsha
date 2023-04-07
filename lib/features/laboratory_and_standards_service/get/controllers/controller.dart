import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEditLaboratoryAndStandardsServiceController extends GetxController {
  PageController pageController = PageController();

  String get pageTitle {
    switch (currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'خدمات إضافية';
      case 2:
        return 'تأكيد الطلب';
      case 3:
        return 'إرسال الطلب';
    }
    return '';
  }

  RxInt currentStep = 0.obs;

  void onPageChanged(int index) => currentStep(index);
  void onTapBack() {
    if (currentStep.value == 0) {
      Get.back();
      return;
    }
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onTapNext() {}
}