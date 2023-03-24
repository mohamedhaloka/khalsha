import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../widgets/custom_button.dart';
import '../inputs_style.dart';
import '../widgets/inputs/text_field_input_with_holder.dart';

class AddLocationSheet extends StatelessWidget {
  const AddLocationSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Divider(
          color: ColorManager.greyColor,
        ),
        const TextFieldInputWithHolder(
          title: 'موقع التحميل',
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        const TextFieldInputWithHolder(
          title: 'وصف الموقع',
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        const SizedBox(height: 20),
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
