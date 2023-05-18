import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import 'input_holder_box.dart';

class YesOrNoWithHolder extends StatelessWidget {
  const YesOrNoWithHolder({
    Key? key,
    required this.title,
    required this.active,
  }) : super(key: key);
  final String? title;
  final RxBool active;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
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
          Expanded(
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      onTap: () => active(!active.value),
                      width: inputHeight,
                      height: inputHeight,
                      radius: radius,
                      backgroundColor:
                          active.value ? Get.theme.primaryColor : Colors.white,
                      contentColor: active.value ? Colors.white : null,
                      imgName: 'true',
                    ),
                    CustomButton(
                      onTap: () => active(false),
                      width: inputHeight,
                      height: inputHeight,
                      radius: radius,
                      backgroundColor:
                          active.value ? Colors.white : Get.theme.primaryColor,
                      contentColor: active.value ? null : Colors.white,
                      imgName: 'false',
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
