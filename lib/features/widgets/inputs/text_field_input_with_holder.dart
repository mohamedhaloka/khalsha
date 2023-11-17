import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/inputs_style.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';
import 'package:khalsha/features/widgets/inputs/input_holder_box.dart';

class TextFieldInputWithHolder extends StatelessWidget {
  const TextFieldInputWithHolder({
    Key? key,
    this.hint,
    this.title,
    this.controller,
    this.padding,
    this.maxLines,
    this.errorText,
    this.enabled,
    this.readOnly,
    this.toolTipMsg,
    this.onSaved,
    this.onChanged,
    this.keyboardType,
    this.onTap,
  }) : super(key: key);
  final String? title, hint, errorText, toolTipMsg;
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final bool? enabled, readOnly;
  final void Function()? onTap;
  final int? maxLines;
  final void Function(String value)? onChanged;
  final void Function(String? value)? onSaved;
  final TextInputType? keyboardType;

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
            const SizedBox(width: 8),
            if (toolTipMsg != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
                child: Tooltip(
                  message: toolTipMsg,
                  child: SvgPicture.asset('assets/images/icons/info.svg'),
                ),
              ),
          ],
          Expanded(
            child: CustomTextField(
              hint: hint,
              controller: controller,
              padding: EdgeInsets.zero,
              height: (maxLines ?? 0) > 1 ? null : inputHeight,
              radius: radius,
              onChanged: onChanged,
              onSaved: onSaved,
              textAlign: TextAlign.center,
              enabled: enabled,
              readOnly: readOnly,
              maxLines: maxLines ?? 1,
              onTap: onTap,
              keyboardType: keyboardType,
              contentPadding: contentPadding,
              borderSide: inputBorderSide,
              contentColor: contentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      errorText: errorText,
      padding: padding,
    );
  }
}
