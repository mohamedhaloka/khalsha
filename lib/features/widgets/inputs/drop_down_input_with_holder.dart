import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/inputs_style.dart';
import 'package:khalsha/features/widgets/custom_drop_down.dart';
import 'package:khalsha/features/widgets/inputs/input_holder_box.dart';

class DropDownInputWithHolder extends StatelessWidget {
  const DropDownInputWithHolder({
    Key? key,
    this.hint,
    this.title,
    this.errorText,
    this.itemHeight,
    this.toolTipMsg,
    this.onTap,
    required this.dropValue,
    required this.source,
  }) : super(key: key);
  final String? title, hint, errorText, toolTipMsg;
  final List<DropdownMenuItem> source;
  final RxString dropValue;
  final void Function(int)? onTap;
  final double? itemHeight;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        children: [
          if (title != null) ...[
            Row(
              children: [
                Text(
                  title ?? '',
                  style: Get.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.greyColor,
                  ),
                ),
                if (toolTipMsg != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
                    child: Tooltip(
                      message: toolTipMsg,
                      child: SvgPicture.asset('assets/images/icons/info.svg'),
                    ),
                  ),
              ],
            ),
          ],
          const Spacer(),
          Expanded(
            flex: 3,
            child: CustomDropDown(
              radius: radius,
              height: inputHeight,
              hint: hint ?? 'إختر',
              dropVal: dropValue,
              itemHeight: itemHeight,
              onTap: onTap == null
                  ? null
                  : (item) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      onTap!(item);
                    },
              isExpanded: true,
              source: source,
              hintColor: ColorManager.greyColor,
              iconColor: ColorManager.greyColor,
            ),
          ),
        ],
      ),
      errorText: errorText,
    );
  }
}
