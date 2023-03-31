import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data/models/item_model.dart';
import '../../../../../domain/entities/package_model.dart';
import '../../../../get/controllers/add_edit_service_controller.dart';

class AddEditAirFreightServiceController extends GetxController {
  final _addEditServiceController = Get.find<AddEditServiceController>();

  PageController get pageController =>
      _addEditServiceController.stepsPageController;

  String get pageTitle {
    switch (_addEditServiceController.currentStep.value) {
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

  RxInt get currentStep => _addEditServiceController.currentStep;

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

  void onPageChanged(int index) =>
      _addEditServiceController.onPageChanged(index);
  void onTapBack() => _addEditServiceController.goBack();
  void onTapNext() => _addEditServiceController.goNext();
}
