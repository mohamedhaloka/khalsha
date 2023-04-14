import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_drop_down.dart';
import 'input_holder_box.dart';

class DropDownInputWithHolder extends StatelessWidget {
  const DropDownInputWithHolder({
    Key? key,
    this.hint,
    this.title,
    required this.source,
  }) : super(key: key);
  final String? title, hint;
  final RxList source;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        children: [
          if (title != null) ...[
            Expanded(
              child: Row(
                children: [
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
              ),
            ),
          ],
          Expanded(
            child: CustomDropDown(
              radius: radius,
              height: inputHeight,
              hint: hint ?? 'إختر',
              dropVal: ''.obs,
              isExpanded: true,
              source: [],
              hintColor: ColorManager.greyColor,
              iconColor: ColorManager.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
