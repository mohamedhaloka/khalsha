import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import 'input_holder_box.dart';

class ChooseItemWithHolder extends StatelessWidget {
  const ChooseItemWithHolder({
    Key? key,
    required this.title,
    this.height,
    this.bottomSheetTitle,
    this.hint,
    this.onBack,
    this.boxColor,
    this.textColor,
    this.errorMsg,
    this.toolTipMsg,
    required this.selectedItem,
    required this.body,
  }) : super(key: key);
  final String title;
  final String? bottomSheetTitle, hint, errorMsg, toolTipMsg;
  final Rx<DataModel> selectedItem;
  final Widget body;
  final double? height;
  final Color? boxColor, textColor;
  final void Function(bool)? onBack;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        children: [
          Text(
            title,
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
          Expanded(
            child: InkWell(
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                final result = await Get.bottomSheet(
                  HeadLineBottomSheet(
                    height: height,
                    body: body,
                    bottomSheetTitle: bottomSheetTitle ?? title,
                  ),
                  isScrollControlled: true,
                ) as bool?;

                if (result == null) return;
                if (onBack == null) return;
                onBack!(result);
              },
              child: Container(
                height: inputHeight,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: const BorderRadius.all(Radius.circular(radius)),
                  border: Border.all(color: ColorManager.lightGreyColor),
                ),
                child: Obx(
                  () => Text(
                    selectedItem.value.name == ''
                        ? hint ?? 'اختر'
                        : selectedItem.value.name,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      errorText: errorMsg,
    );
  }
}
