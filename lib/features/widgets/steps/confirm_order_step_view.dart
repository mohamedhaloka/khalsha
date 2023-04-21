import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../inputs/text_field_input_with_holder.dart';

class ConfirmOrderStepView extends StatelessWidget {
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
          hint: 'اسم الشخص المستلم',
        ),
        const TextFieldInputWithHolder(
          hint: 'رقم الجوال',
        ),
        const TextFieldInputWithHolder(
          hint: 'الإيميل',
        ),
      ],
    );
  }
}
