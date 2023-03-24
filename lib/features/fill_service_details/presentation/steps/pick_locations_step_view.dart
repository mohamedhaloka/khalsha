import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/bottom_sheet_content/add_location_sheet.dart';

import '../bottom_sheet_content/choose_date_time_sheet.dart';
import '../get/controllers/pick_locations_step_controller.dart';
import '../widgets/inputs/service_item_with_holder.dart';

class PickLocationsStepView extends GetView<PickLocationsStepController> {
  const PickLocationsStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/pick-locations.svg',
        ),
        const SizedBox(height: 20),
        ServiceItemWithHolder(
          title: 'موقع التحميل',
          bottomSheetTitle: 'موقع التحميل',
          height: Get.height / 2,
          body: const AddLocationSheet(),
        ),
        ServiceItemWithHolder(
          title: 'موقع التسليم',
          bottomSheetTitle: 'موقع التسليم',
          height: Get.height / 2,
          body: const AddLocationSheet(),
        ),
        ServiceItemWithHolder(
          title: 'تاريخ ووقت التحميل',
          bottomSheetTitle: 'اختر التاريخ و الوقت',
          height: Get.height / 1.8,
          body: const ChooseDateTimeSheet(),
        ),
        ServiceItemWithHolder(
          title: 'تاريخ ووقت التسليم',
          bottomSheetTitle: 'اختر التاريخ و الوقت',
          height: Get.height / 1.8,
          body: const ChooseDateTimeSheet(),
        ),
      ],
    );
  }
}
