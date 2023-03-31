import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/service_content.dart';
import 'package:khalsha/features/fill_service_details/presentation/steps/fill_data_step_view.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../bottom_sheet_content/customs_clause.dart';
import '../../bottom_sheet_content/multi_items_list.dart';
import '../../bottom_sheet_content/set_number_count.dart';
import '../../steps/additional_service_step_view.dart';
import '../../steps/attach_files_step_view.dart';
import '../../steps/confirm_order_step_view.dart';
import '../../steps/order_send_successfully_step_view.dart';
import '../../utils.dart';
import '../../widgets/inputs/choose_item_with_holder.dart';
import '../../widgets/inputs/service_item_with_holder.dart';
import '../../widgets/inputs/text_field_input_with_holder.dart';
import '../../widgets/inputs/toggle_item_with_holder.dart';
import '../../widgets/inputs/twice_text_field_input_with_holder.dart';
import 'get/controllers/controller.dart';

class AddEditCustomsClearanceServiceView
    extends GetView<AddEditCustomsClearanceController> {
  const AddEditCustomsClearanceServiceView({Key? key}) : super(key: key);

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
        AttachFilesStepView(),
        ConfirmOrderStepView(),
        OrderSendSuccessfullyStepView(),
      ],
    );
  }
}

class _FillData extends GetView<AddEditCustomsClearanceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceType.customsClearance.value,
      body: Column(
        children: [
          ToggleItemWithHolder(
            title: 'مجال الشحنة',
            items: shippingFieldOptions,
            selectedItem: controller.selectedShippingField,
          ),
          ToggleItemWithHolder(
            title: 'نوع الشحنة',
            items: shippingTypeOptions,
            selectedItem: controller.selectedShippingType,
          ),
          ChooseItemWithHolder(
            title: 'منفذ الشحنة',
            selectedItem: controller.selectedShippingPlace,
            bottomSheetTitle: 'اختر منفذ الشحنة',
            height: Get.height / 2,
            body: MultiItemsList(
              items: testItemsList,
              selectedItem: controller.selectedShippingPlace,
            ),
          ),
          const TextFieldInputWithHolder(
            title: 'التوصيل إلي',
          ),
          const TextFieldInputWithHolder(
            hint: 'وصف البضاعة',
          ),
          const TwiceTextFieldInputWithHolder(
            title: 'الإجمالي',
            firstInputHint: '2000',
            firstInputFlex: 2,
            secondInputHint: 'ر.س',
          ),
          ToggleItemWithHolder(
            title: 'نوع الشحن',
            items: shipTypeOptions,
            selectedItem: controller.selectedShipType,
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices extends GetView<AddEditCustomsClearanceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          ServiceItemWithHolder(
            title: 'هل تريد التخزين',
            bottomSheetTitle: 'خدمة التخزين',
            height: Get.height / 3,
            body: SetNumberCount(
              number: controller.numberOfStorage,
              title: 'عدد أيام التخزين',
            ),
          ),
          ServiceItemWithHolder(
            title: 'هل يوجد بند جمركي',
            bottomSheetTitle: 'إضافة بند جمركي',
            height: Get.height / 2,
            body: CustomsClause(
              customsClause: controller.customsClauseList,
              onAdd: controller.addNewClause,
            ),
          ),
        ],
      ),
    );
  }
}
