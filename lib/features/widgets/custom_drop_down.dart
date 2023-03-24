import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/themes/colors_manager.dart';

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
      this.radius,
      this.fontSize,
      this.isExpanded,
      this.onTapUpper,
      Key? key})
      : super(key: key);

  final double? height;
  final String? title, hint;
  final RxString dropVal;
  final RxList source;
  final ValueChanged<int>? onTap;
  final Color? hintColor, iconColor;
  final double? radius, fontSize;
  final Border? border;
  final bool? isExpanded;
  final Function()? onTapUpper;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            (title ?? '').tr,
            style: Get.textTheme.subtitle2!.copyWith(),
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
                        style: Get.textTheme.caption!.copyWith(
                            color: hintColor ?? Colors.black,
                            fontSize: fontSize)),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: iconColor ?? Colors.black,
                    ),
                    style:
                        Get.textTheme.subtitle1!.copyWith(fontSize: fontSize),
                    onChanged: (value) {
                      dropVal(value.toString());
                      if (onTap != null) {
                        onTap!.call(int.tryParse(value.toString()) ?? 0);
                      }
                    },
                    isExpanded: isExpanded ?? false,
                    items: source
                        .map((e) => DropdownMenuItem(
                              value: e.toString(),
                              child: Text(e),
                            ))
                        .toList(),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
