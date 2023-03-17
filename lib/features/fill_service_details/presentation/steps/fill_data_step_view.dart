import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/fill_data_controller.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/choose_item_with_holder.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/multi_text_field_input_with_holder.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/text_field_input_with_holder.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/toggle_item_with_holder.dart';

import '../bottom_sheet_content/multi_items_list.dart';

class FillDataView extends GetView<FillDataController> {
  const FillDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'بيانات خدمة ${controller.serviceType.value.tr}',
            style: Get.textTheme.bodyMedium!.copyWith(
              color: ColorManager.greyColor,
            ),
          ),
        ),
        const TextFieldInputWithHolder(
          title: 'عنوان الطلب',
        ),
        ToggleItemWithHolder(
          title: 'مجال الشحنة',
          items: controller.shippingFieldOptions,
          selectedItem: controller.selectedShippingField,
        ),
        ToggleItemWithHolder(
          title: 'نوع الشحنة',
          items: controller.shippingTypeOptions,
          selectedItem: controller.selectedShippingType,
        ),
        ChooseItemWithHolder(
          title: 'منفذ الشحنة',
          selectedItem: controller.selectedShippingPlace,
          bottomSheetTitle: 'اختر منفذ الشحنة',
          height: Get.height / 2,
          body: MultiItemsList(
            items: controller.shippingPlacesOptions,
            selectedItem: controller.selectedShippingPlace,
          ),
        ),
        const TextFieldInputWithHolder(
          title: 'التوصيل إلي',
        ),
        const TextFieldInputWithHolder(
          hint: 'وصف البضاعة',
        ),
        const MultiTextFieldInputWithHolder(
          title: 'الإجمالي',
          firstInputHint: '2000',
          firstInputFlex: 2,
          secondInputHint: 'ر.س',
        ),
        ToggleItemWithHolder(
          title: 'نوع الشحن',
          items: controller.shipTypeOptions,
          selectedItem: controller.selectedShipType,
        ),
      ],
    );
  }
}
