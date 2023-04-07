import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_button.dart';
import '../inputs/choose_number_with_holder.dart';
import '../inputs/text_field_input_with_holder.dart';

class SetShippingDetails extends StatelessWidget {
  const SetShippingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Divider(
          color: ColorManager.greyColor,
        ),
        const TextFieldInputWithHolder(
          title: 'وصف البضاعة',
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        const TextFieldInputWithHolder(
          title: 'نوع الحاوية',
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        ChooseNumberWithHolder(
          title: 'عدد الحاويات',
          currentNumber: 0.obs,
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        Center(
          child: CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              Get.back();
            },
          ),
        )
      ],
    );
  }
}
