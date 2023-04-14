import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InternationalPrivateTransferLandShippingServiceController
    extends GetxController {
  PageController pageController = PageController();

  RxInt currentIndex = 0.obs;

  RxList<int> items = <int>[1].obs;

  String get pageTitle {
    switch (currentIndex.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'خدمات إضافية';
      case 2:
        return 'تحديد الموقع و التوقيت';
      case 3:
        return 'إرسال الطلب';
      case 4:
        return 'تأكيد الطلب';
    }
    return '';
  }

  void onPageChanged(int index) => currentIndex(index);
  void onTapBack() {
    if (currentIndex.value == 0) {
      Get.back();
      return;
    }
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onTapNext() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
