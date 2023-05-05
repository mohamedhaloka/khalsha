import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/land_shipping/land_shipping.dart';

import '../inputs/text_field_input_with_holder.dart';

class ConfirmOrderStepView
    extends GetView<AddEditLandShippingServiceController> {
  const ConfirmOrderStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/confirm-service.svg',
        ),
        const SizedBox(height: 20),
        TextFieldInputWithHolder(
          hint: 'اسم الشخص المستلم',
          controller: controller.recipientName,
        ),
        TextFieldInputWithHolder(
          hint: 'رقم الجوال',
          controller: controller.recipientMobile,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
