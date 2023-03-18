import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/bottom_sheet_content/set_number_count.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/additional_service_step_controller.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/additional_service_item_with_holder.dart';

import '../../../../service_intro/presentation/get/controllers/controller.dart';
import '../../bottom_sheet_content/customs_clause.dart';

part 'customs_clearance.dart';
part 'land_shipping.dart';

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
        return Text('lll');
      case ServiceType.marineShipping:
        return Text('lll');
      case ServiceType.airFreight:
        return Text('lll');
      case ServiceType.laboratoryAndStandards:
        return Text('lll');
    }
  }
}
