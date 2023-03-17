import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

import '../../inputs_style.dart';
import 'input_holder_box.dart';

class AdditionalServiceItemWithHolder extends StatelessWidget {
  const AdditionalServiceItemWithHolder({
    Key? key,
    this.title,
    required this.bottomSheetTitle,
    this.height,
    this.builder,
    this.onTap,
    required this.number,
    required this.body,
  }) : super(key: key);
  final String? title;
  final String bottomSheetTitle;
  final RxInt number;
  final Widget body;
  final double? height;
  final String Function(int number)? builder;
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
              Obx(
                () => CustomButton(
                  height: inputHeight,
                  width: inputHeight + 50,
                  onTap: () {

                    if(onTap != null) {
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
                  contentColor:
                      number.value == 0 ? ColorManager.greyColor : Colors.white,
                  backgroundColor:
                      number.value == 0 ? null : ColorManager.primaryColor,
                  text: number.value == 0 ? 'إضافة' : builder!(number.value),
                ),
              ),
              const SizedBox(width: 6),
              CustomButton(
                height: inputHeight,
                width: inputHeight,
                radius: radius,
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
