import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/fill_data_controller.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/attach_file_with_holder.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/choose_item_with_holder.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/multi_text_field_input_with_holder.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/text_field_input_with_holder.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/toggle_item_with_holder.dart';

import '../../../../service_intro/presentation/get/controllers/controller.dart';
import '../../bottom_sheet_content/choose_shipping_place.dart';
import '../../bottom_sheet_content/multi_items_list.dart';
import '../../bottom_sheet_content/set_shipping_details.dart';
import '../../widgets/inputs/additional_service_item_with_holder.dart';

part 'air_freight.dart';
part 'customs_clearance.dart';
part 'laboratory_and_standards.dart';
part 'land_shipping.dart';
part 'marine_shipping.dart';
part 'stores.dart';

class FillDataStepView extends GetView<FillDataController> {
  const FillDataStepView({Key? key}) : super(key: key);

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
        const _Body(),
      ],
    );
  }
}

class _Body extends GetView<FillDataController> {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (controller.serviceType) {
      case ServiceType.customsClearance:
        return const _CustomsClearance();
      case ServiceType.landShipping:
        return const _LandShipping();
      case ServiceType.stores:
        return const _Stores();
      case ServiceType.marineShipping:
        return const _MarineShipping();
      case ServiceType.airFreight:
        return const _AirFreight();
      case ServiceType.laboratoryAndStandards:
        return const _LaboratoryAndStandards();
    }
  }
}
