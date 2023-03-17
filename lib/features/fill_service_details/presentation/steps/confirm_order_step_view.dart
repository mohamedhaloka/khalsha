import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../get/controllers/confirm_order_step_controller.dart';
import '../widgets/inputs/multi_text_field_input_with_holder.dart';
import '../widgets/inputs/text_field_input_with_holder.dart';

class ConfirmOrderStepView extends GetView<ConfirmOrderStepController> {
  const ConfirmOrderStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/confirm-service.svg',
        ),
        const SizedBox(height: 20),
        const TextFieldInputWithHolder(
          hint: 'اسم الشحن المسئول',
        ),
        const MultiTextFieldInputWithHolder(
          firstInputHint: 'رقم الجوال',
          secondInputHint: '33+',
          firstInputFlex: 5,
        ),
        const TextFieldInputWithHolder(
          hint: 'الإيميل',
        ),
      ],
    );
  }
}
