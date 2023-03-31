import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../inputs_style.dart';
import 'input_holder_box.dart';

class TwiceTextFieldInputWithHolder extends StatelessWidget {
  const TwiceTextFieldInputWithHolder({
    Key? key,
    this.title,
    this.firstInputHint,
    this.secondInputHint,
    this.firstInputFlex,
    this.secondInputFlex,
    this.firstInputController,
    this.secondInputController,
  }) : super(key: key);
  final String? title, firstInputHint, secondInputHint;
  final int? firstInputFlex, secondInputFlex;
  final TextEditingController? firstInputController, secondInputController;

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
            child: CustomTextField(
              hint: secondInputHint,
              controller: secondInputController,
              textAlign: TextAlign.center,
              padding: EdgeInsets.zero,
              height: inputHeight,
              radius: radius,
              contentPadding: contentPadding,
              borderSide: inputBorderSide,
              contentColor: contentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
