import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {this.text,
      this.subText,
      this.onTap,
      this.textAlign,
      this.textStyle,
      this.subTextStyle,
      this.padding,
      Key? key})
      : super(key: key);

  final String? text, subText;
  final TextStyle? textStyle, subTextStyle;
  final void Function()? onTap;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: RichText(
        textAlign: textAlign ?? TextAlign.center,
        text: TextSpan(
          text: text,
          style: textStyle ??
              Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
          children: [
            TextSpan(
                text: subText,
                recognizer: TapGestureRecognizer()..onTap = onTap,
                style: subTextStyle ??
                    Get.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.secondaryColor,
                    )),
          ],
        ),
      ),
    );
  }
}
