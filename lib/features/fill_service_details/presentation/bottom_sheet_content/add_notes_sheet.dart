import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../inputs_style.dart';

class AddNotesSheet extends StatelessWidget {
  const AddNotesSheet({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: [
        CustomTextField(
          title: text,
          maxLines: 4,
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
              Get.back(result: true);
            },
          ),
        )
      ],
    );
  }
}
