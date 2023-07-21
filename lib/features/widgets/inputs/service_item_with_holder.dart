import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import 'input_holder_box.dart';

class ServiceItemWithHolder extends StatelessWidget {
  const ServiceItemWithHolder({
    Key? key,
    required this.title,
    this.bottomSheetTitle,
    this.height,
    this.onTap,
    this.text,
    this.errorMsg,
    this.onBack,
    this.onDelete,
    this.body,
    this.toolTipMsg,
    this.btnHeight,
    this.btnWidth,
  }) : super(key: key);
  final String title;
  final String? bottomSheetTitle, text, errorMsg, toolTipMsg;
  final Widget? body;
  final double? height, btnHeight, btnWidth;
  final void Function()? onTap, onDelete;
  final void Function(bool)? onBack;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: Get.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.greyColor,
                    ),
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
          ),
          Row(
            children: [
              CustomButton(
                height: btnHeight ?? inputHeight,
                width: btnWidth ?? inputHeight + 30,
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (onTap != null) {
                    onTap!();
                    return;
                  }

                  final result = await Get.bottomSheet(
                    HeadLineBottomSheet(
                      height: height,
                      body: body ?? const SizedBox(),
                      bottomSheetTitle: bottomSheetTitle ?? title,
                    ),
                    isScrollControlled: true,
                    enableDrag: false,
                    isDismissible: false,
                  ) as bool?;

                  if (result == null) return;
                  if (onBack == null) return;
                  onBack!(result);
                },
                radius: radius,
                contentColor:
                    text != null ? Colors.white : ColorManager.greyColor,
                backgroundColor:
                    text != null ? ColorManager.primaryColor : null,
                text: text ?? 'إضافة',
              ),
              if (onDelete != null) ...[
                const SizedBox(width: 6),
                CustomButton(
                  height: inputHeight,
                  width: inputHeight,
                  radius: radius,
                  contentColor: contentColor,
                  onTap: onDelete,
                  imgName: 'delete',
                ),
              ],
            ],
          )
        ],
      ),
      errorText: errorMsg,
    );
  }
}
