import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/fill_service_details/presentation/bottom_sheet_content/set_number_count.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/additional_service_step_controller.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/checker_with_holder.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/service_item_with_holder.dart';

import '../../../../service_intro/presentation/get/controllers/controller.dart';
import '../../../../widgets/headline_bottom_sheet.dart';
import '../../bottom_sheet_content/add_notes_sheet.dart';
import '../../bottom_sheet_content/choose_certificates.dart';
import '../../bottom_sheet_content/customs_clause.dart';
import '../../bottom_sheet_content/order_temperature.dart';
import '../../bottom_sheet_content/storage_service.dart';
import '../../widgets/inputs/yes_or_no_with_holder.dart';

part 'air_freight.dart';
part 'customs_clearance.dart';
part 'laboratory_and_standards.dart';
part 'land_shipping.dart';
part 'marine_shipping.dart';
part 'stores.dart';

class AdditionalServiceStepView
    extends GetView<AdditionalServiceStepController> {
  const AdditionalServiceStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/additional_service.svg',
        ),
        const SizedBox(height: 20),
        const _Body(),
      ],
    );
  }
}

class _Body extends GetView<AdditionalServiceStepController> {
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
