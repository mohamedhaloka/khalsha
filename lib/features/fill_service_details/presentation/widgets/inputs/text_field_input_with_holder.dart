import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../inputs_style.dart';
import 'input_holder_box.dart';

class TextFieldInputWithHolder extends StatelessWidget {
  const TextFieldInputWithHolder({
    Key? key,
    this.hint,
    this.title,
    this.controller,
  }) : super(key: key);
  final String? title, hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        children: [
          if (title != null) ...[
            Text(
              title ?? '',
              style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.greyColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset('assets/images/icons/info.svg'),
              ),
            ),
          ],
          Expanded(
            child: CustomTextField(
              hint: hint,
              controller: controller,
              padding: EdgeInsets.zero,
              height: inputHeight,
              radius: radius,
              textAlign: TextAlign.center,
              contentPadding: contentPadding,
              borderSide: inputBorderSize,
              contentColor: contentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
