import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/bottom_sheet_content/set_number_count.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/additional_service_step_controller.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/additional_service_item_with_holder.dart';

import '../bottom_sheet_content/customs_clause.dart';

class AdditionalServiceStepView
    extends GetView<AdditionalServiceStepController> {
  const AdditionalServiceStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/additional_service.svg',
        ),
        const SizedBox(height: 20),
        AdditionalServiceItemWithHolder(
          title: 'هل تريد التخزين',
          number: controller.numberOfStorage,
          bottomSheetTitle: 'خدمة التخزين',
          height: Get.height / 3,
          builder: (int number) => '$number يوم',
          body: SetNumberCount(
            number: controller.numberOfStorage,
            title: 'عدد أيام التخزين',
          ),
        ),
        AdditionalServiceItemWithHolder(
          title: 'هل يوجد بند جمركي',
          number: controller.customsClauseList.length.obs,
          bottomSheetTitle: 'إضافة بند جمركي',
          height: Get.height / 2,
          builder: (int number) => '$number يوم',
          body: CustomsClause(
            customsClause: controller.customsClauseList,
            onAdd: controller.addNewClause,
          ),
        ),
      ],
    );
  }
}
