import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data/models/item_model.dart';

class AddEditLandShippingServiceController extends GetxController {
  PageController pageController = PageController();

  RxInt currentIndex = 0.obs;

  String get pageTitle {
    switch (currentIndex.value) {
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

  RxInt selectedShippingField = 0.obs;

  RxInt selectedShippingType = 0.obs;

  RxInt selectedMarineOrderSize = 0.obs;

  RxInt selectedStoresOrderSize = 0.obs;

  Rx<ItemModel> selectedShippingPlace = ItemModel.empty().obs;

  RxInt selectedShipType = 0.obs;

  RxInt numberOfStorage = 0.obs;

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
