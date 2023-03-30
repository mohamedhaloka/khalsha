import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/add_edit_service_controller.dart';

import '../../../../../../../core/models/item_model.dart';
import '../../../../../domain/entities/customs_clause_model.dart';
import '../../../../../domain/entities/package_model.dart';

class AddEditCustomsClearanceController extends GetxController {
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
        return 'رفع الملفات';
      case 3:
        return 'تأكيد الطلب';
      case 4:
        return 'إرسال الطلب';
    }
    return '';
  }

  RxInt get currentStep => _addEditServiceController.currentStep;

  RxInt selectedShippingField = 0.obs;

  RxInt selectedShippingType = 0.obs;

  RxInt selectedMarineOrderSize = 0.obs;

  RxInt selectedStoresOrderSize = 0.obs;

  Rx<ItemModel> selectedShippingPlace = ItemModel.empty().obs;

  RxInt selectedShipType = 0.obs;

  RxList<PackageModel> packages = <PackageModel>[
    PackageModel.newItem(),
  ].obs;

  void addNewPackageItem() => packages.add(PackageModel.newItem());
  void onPageChanged(int index) =>
      _addEditServiceController.onPageChanged(index);
  void onTapBack() => _addEditServiceController.goBack();
  void onTapNext() => _addEditServiceController.goNext(4);

  RxInt numberOfStorage = 0.obs;

  RxList<CustomsClauseModel> customsClauseList = <CustomsClauseModel>[].obs;

  void addNewClause() => customsClauseList.add(CustomsClauseModel.newItem());
}
