import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../core/models/item_model.dart';
import '../../../../../domain/entities/customs_clause_model.dart';
import '../../../../get/controllers/add_edit_service_controller.dart';

class AddEditLandShippingServiceController extends GetxController {
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

  RxInt selectedShippingField = 0.obs;

  RxInt selectedShippingType = 0.obs;

  RxInt selectedMarineOrderSize = 0.obs;

  RxInt selectedStoresOrderSize = 0.obs;

  Rx<ItemModel> selectedShippingPlace = ItemModel.empty().obs;

  RxInt selectedShipType = 0.obs;

  RxInt numberOfStorage = 0.obs;

  RxList<CustomsClauseModel> customsClauseList = <CustomsClauseModel>[].obs;

  void addNewClause() => customsClauseList.add(CustomsClauseModel.newItem());

  void onPageChanged(int index) =>
      _addEditServiceController.onPageChanged(index);
  void onTapBack() => _addEditServiceController.goBack();
  void onTapNext() => _addEditServiceController.goNext(4);
}
