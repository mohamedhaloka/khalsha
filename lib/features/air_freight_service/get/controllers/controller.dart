import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data/models/item_model.dart';
import '../../models/package_model.dart';

class AddEditAirFreightServiceController extends GetxController {
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

  RxInt selectedShippingType = 0.obs;

  Rx<ItemModel> selectedShippingPlace = ItemModel.empty().obs;

  RxInt selectedShipType = 0.obs;
  List<ItemModel> shipTypeOptions = const <ItemModel>[
    ItemModel(
      text: 'طرد',
      id: 0,
    ),
    ItemModel(
      text: 'حاوية',
      id: 1,
    )
  ];

  RxList<PackageModel> packages = <PackageModel>[
    PackageModel.newItem(),
  ].obs;

  void addNewPackageItem() => packages.add(PackageModel.newItem());

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
