import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data/models/item_model.dart';

class AddEditStoresServiceController extends GetxController {
  PageController pageController = PageController();
  RxInt currentStep = 0.obs;

  String get pageTitle {
    switch (currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'تفاصيل الشحنة';
      case 2:
        return 'خدمات إضافية';
      case 3:
        return 'تأكيد الطلب';
      case 4:
        return 'إرسال الطلب';
    }
    return '';
  }

  RxInt selectedShippingField = 0.obs;

  RxInt selectedShippingType = 0.obs;

  RxInt selectedMarineOrderSize = 0.obs;

  RxInt selectedStoresOrderSize = 0.obs;

  Rx<ItemModel> selectedShippingPlace = ItemModel.empty().obs;

  RxInt selectedShipType = 0.obs;

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

  void onTapNext() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
