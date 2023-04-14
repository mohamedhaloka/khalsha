import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/routes/app_routes.dart';
import '../../../map/data/model/location_details.dart';

class AddEditMarineShippingServiceController extends GetxController {
  PageController pageController = PageController();

  RxInt currentStep = 0.obs;

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
  RxInt selectedMarineOrderSize = (-1).obs;

  LocationDetails deliverFromLocationDetails = LocationDetails(),
      deliverToLocationDetails = LocationDetails();
  TextEditingController deliverFrom = TextEditingController(),
      deliverTo = TextEditingController();

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

  void chooseLocation(bool addShippingFrom) async {
    Object? args;

    if (addShippingFrom) {
      args = deliverFromLocationDetails;
    } else {
      args = deliverToLocationDetails;
    }

    final result = await Get.toNamed(Routes.map, arguments: args);
    if (result == null) return;
    if (result is LocationDetails) {
      if (addShippingFrom) {
        deliverFromLocationDetails = result;
        deliverFrom.text = result.name ?? '';
      } else {
        deliverToLocationDetails = result;
        deliverTo.text = result.name ?? '';
      }
    }
  }
}
