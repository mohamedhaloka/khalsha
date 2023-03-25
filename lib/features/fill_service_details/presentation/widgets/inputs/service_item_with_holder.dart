import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

import '../../inputs_style.dart';
import 'input_holder_box.dart';

class ServiceItemWithHolder extends StatelessWidget {
  const ServiceItemWithHolder({
    Key? key,
    this.title,
    required this.bottomSheetTitle,
    this.height,
    this.onTap,
    required this.body,
  }) : super(key: key);
  final String? title;
  final String bottomSheetTitle;
  final Widget body;
  final double? height;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title ?? '',
                    style: Get.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.greyColor,
                    ),
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
          Row(
            children: [
              CustomButton(
                height: inputHeight,
                width: inputHeight + 50,
                onTap: () {
                  if (onTap != null) {
                    onTap!();
                    return;
                  }

                  Get.bottomSheet(
                    HeadLineBottomSheet(
                      height: height,
                      body: body,
                      bottomSheetTitle: bottomSheetTitle,
                    ),
                    isScrollControlled: true,
                  );
                },
                radius: radius,
                contentColor: ColorManager.greyColor,
                text: 'إضافة',
              ),
              const SizedBox(width: 6),
              CustomButton(
                height: inputHeight,
                width: inputHeight,
                radius: radius,
                contentColor: contentColor,
                onTap: () {},
                imgName: 'delete',
              ),
            ],
          )
        ],
      ),
    );
  }
}
