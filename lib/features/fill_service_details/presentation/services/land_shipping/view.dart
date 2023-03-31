import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/steps/pick_locations_step_view.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../bottom_sheet_content/multi_items_list.dart';
import '../../bottom_sheet_content/order_temperature.dart';
import '../../bottom_sheet_content/set_number_count.dart';
import '../../bottom_sheet_content/storage_service.dart';
import '../../service_content.dart';
import '../../steps/additional_service_step_view.dart';
import '../../steps/confirm_order_step_view.dart';
import '../../steps/fill_data_step_view.dart';
import '../../steps/order_send_successfully_step_view.dart';
import '../../utils.dart';
import '../../widgets/inputs/choose_item_with_holder.dart';
import '../../widgets/inputs/service_item_with_holder.dart';
import '../../widgets/inputs/text_field_input_with_holder.dart';
import '../../widgets/inputs/toggle_item_with_holder.dart';
import '../../widgets/inputs/yes_or_no_with_holder.dart';
import 'get/controllers/controller.dart';

class AddEditLandShippingServiceView
    extends GetView<AddEditLandShippingServiceController> {
  const AddEditLandShippingServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ServiceContent(
      onTapBack: controller.onTapBack,
      onPageChanged: controller.onPageChanged,
      pageViewController: controller.pageController,
      pageTitle: controller.pageTitle,
      onTapNext: controller.onTapNext,
      children: const [
        _FillData(),
        _AdditionalServices(),
        PickLocationsStepView(),
        ConfirmOrderStepView(),
        OrderSendSuccessfullyStepView(),
      ],
    );
  }
}

class _FillData extends GetView<AddEditLandShippingServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceType.landShipping.value,
      body: Column(
        children: [
          ToggleItemWithHolder(
            title: 'نوع الشحن',
            items: shippingFieldOptions,
            selectedItem: controller.selectedShippingField,
          ),
          ChooseItemWithHolder(
            title: 'نوع الشاحنة',
            selectedItem: controller.selectedShippingPlace,
            bottomSheetTitle: 'نوع الشاحنة',
            height: Get.height / 2,
            body: MultiItemsList(
              items: testItemsList,
              selectedItem: controller.selectedShippingPlace,
            ),
          ),
          ChooseItemWithHolder(
            title: 'نوع الشحنة',
            selectedItem: controller.selectedShippingPlace,
            bottomSheetTitle: 'نوع الشحنة',
            height: Get.height / 2,
            body: MultiItemsList(
              items: testItemsList,
              selectedItem: controller.selectedShippingPlace,
            ),
          ),
          ChooseItemWithHolder(
            title: 'شحن دولي',
            selectedItem: controller.selectedShippingPlace,
            bottomSheetTitle: 'شحن دولي',
            height: Get.height / 2,
            body: MultiItemsList(
              items: testItemsList,
              selectedItem: controller.selectedShippingPlace,
            ),
          ),
          const TextFieldInputWithHolder(
            hint: 'وصف الشحنة',
          ),
          const TextFieldInputWithHolder(
            hint: 'أضف ملاحظات',
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices
    extends GetView<AddEditLandShippingServiceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          ServiceItemWithHolder(
            title: 'خدمة الفك و التركيب',
            bottomSheetTitle: 'خدمة التخزين',
            height: Get.height / 1.5,
            body: const StorageService(),
          ),
          ServiceItemWithHolder(
            title: 'درجة حرارة الشحنة',
            bottomSheetTitle: 'درجة الحرارة',
            height: Get.height / 2,
            body: const OrderTemperature(),
          ),
          ServiceItemWithHolder(
            title: 'هل تحتاج عمال تحميل',
            bottomSheetTitle: 'عمال تحميل',
            height: Get.height / 3,
            body: SetNumberCount(
              number: controller.numberOfStorage,
              title: 'عدد العمال',
            ),
          ),
          ServiceItemWithHolder(
            title: 'هل تحتاج عمال تنزيل',
            bottomSheetTitle: 'عمال تنزيل',
            height: Get.height / 3,
            body: SetNumberCount(
              number: controller.numberOfStorage,
              title: 'عدد العمال',
            ),
          ),
          ServiceItemWithHolder(
            title: 'هل تريد التخزين',
            bottomSheetTitle: 'خدمة التخزين',
            height: Get.height / 3,
            body: SetNumberCount(
              number: controller.numberOfStorage,
              title: 'عدد أيام التخزين',
            ),
          ),
          YesOrNoWithHolder(
            active: true.obs,
            title: 'هل توجد مواد قابلة للإشتعال',
          ),
        ],
      ),
    );
  }
}
