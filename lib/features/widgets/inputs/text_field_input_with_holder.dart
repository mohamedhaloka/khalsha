import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_text_field.dart';
import 'input_holder_box.dart';

class TextFieldInputWithHolder extends StatelessWidget {
  const TextFieldInputWithHolder({
    Key? key,
    this.hint,
    this.title,
    this.controller,
    this.padding,
    this.enabled,
    this.onTap,
  }) : super(key: key);
  final String? title, hint;
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final bool? enabled;
  final void Function()? onTap;

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
              enabled: enabled,
              onTap: onTap,
              contentPadding: contentPadding,
              borderSide: inputBorderSide,
              contentColor: contentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      padding: padding,
    );
  }
}
