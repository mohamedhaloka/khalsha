import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_drop_down.dart';
import '../custom_text_field.dart';
import 'input_holder_box.dart';

class TextFieldInputWithDropDownWithHolder extends StatelessWidget {
  const TextFieldInputWithDropDownWithHolder({
    Key? key,
    this.title,
    this.firstInputHint,
    this.secondInputHint,
    this.firstInputFlex,
    this.secondInputFlex,
    this.firstInputController,
    this.errorMsg,
    required this.selectedDropDownValue,
    required this.source,
  }) : super(key: key);
  final String? title, firstInputHint, secondInputHint, errorMsg;
  final int? firstInputFlex, secondInputFlex;
  final TextEditingController? firstInputController;
  final RxString selectedDropDownValue;
  final List<DropdownMenuItem> source;

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
            flex: firstInputFlex ?? 1,
            child: CustomTextField(
              hint: firstInputHint,
              controller: firstInputController,
              padding: EdgeInsets.zero,
              height: inputHeight,
              radius: radius,
              contentPadding: contentPadding,
              borderSide: inputBorderSide,
              contentColor: contentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: secondInputFlex ?? 1,
            child: CustomDropDown(
              hint: secondInputHint,
              isExpanded: true,
              height: inputHeight,
              radius: radius,
              fontSize: 10,
              icon: const SizedBox(),
              dropVal: selectedDropDownValue,
              source: source,
            ),
          ),
        ],
      ),
      errorText: errorMsg,
    );
  }
}
