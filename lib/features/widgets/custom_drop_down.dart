import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/presentation/themes/colors_manager.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {this.hint,
      this.title,
      required this.dropVal,
      required this.source,
      this.hintColor,
      this.iconColor,
      this.onTap,
      this.border,
      this.height,
      this.itemHeight,
      this.radius,
      this.fontSize,
      this.icon,
      this.isExpanded,
      this.onTapUpper,
      Key? key})
      : super(key: key);

  final double? height;
  final String? title, hint;
  final RxString dropVal;
  final List<DropdownMenuItem> source;
  final ValueChanged<int>? onTap;
  final Color? hintColor, iconColor;
  final double? radius, fontSize, itemHeight;
  final Border? border;
  final bool? isExpanded;
  final Function()? onTapUpper;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            (title ?? '').tr,
            style: Get.textTheme.titleSmall!.copyWith(),
          ),
        ],
        InkWell(
          onTap: onTapUpper,
          child: Container(
            height: height ?? 50,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 30),
              border: border ?? Border.all(color: ColorManager.lightGreyColor),
            ),
            child: Obx(() => DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: dropVal.value == '' ? null : dropVal.value,
                    hint: Text((hint ?? '').tr,
                        style: Get.textTheme.bodySmall!.copyWith(
                            color: hintColor ?? Colors.black,
                            fontSize: fontSize)),
                    icon: icon ??
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: iconColor ?? Colors.black,
                        ),
                    style:
                        Get.textTheme.titleMedium!.copyWith(fontSize: fontSize),
                    onChanged: (value) {
                      dropVal(value.toString());
                      if (onTap != null) {
                        onTap!.call(int.tryParse(value.toString()) ?? 0);
                      }
                    },
                    itemHeight: itemHeight ?? 60,
                    isExpanded: isExpanded ?? false,
                    items: source,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
