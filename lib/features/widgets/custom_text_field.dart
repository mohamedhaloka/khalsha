import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.hint,
      this.prefixImg,
      this.borderSide,
      this.controller,
      this.enabled,
      this.title,
      this.helper,
      this.fontWeight,
      this.width,
      this.onSaved,
      this.suffixImg,
      this.textAlign,
      this.onChanged,
      this.height,
      this.prefixIcon,
      this.contentPadding,
      this.readOnly,
      this.padding,
      this.validator,
      this.maxLength,
      this.hintColor,
      this.titleStyle,
      this.passSecure,
      this.onSubmitted,
      this.keyboardType,
      this.suffixIcon,
      this.onTap,
      this.activeBorderColor,
      this.inputType,
      this.radius,
      this.contentColor,
      this.fontSize,
      this.textInputAction,
      this.inputBorder,
      this.fillColor,
      this.maxLines = 1})
      : super(key: key);

  CustomTextField.withBorder(
      {super.key,
      this.hint,
      this.controller,
      this.prefixImg,
      this.suffixImg,
      this.suffixIcon,
      this.prefixIcon,
      this.enabled,
      this.contentColor,
      this.title,
      this.inputBorder,
      this.height,
      this.onTap,
      this.readOnly,
      this.activeBorderColor,
      this.fontSize,
      this.validator,
      this.onChanged,
      this.maxLength,
      this.fontWeight,
      this.helper,
      this.onSubmitted,
      this.padding,
      this.keyboardType,
      this.textAlign,
      this.textInputAction,
      this.onSaved,
      this.inputType,
      this.width,
      this.contentPadding,
      this.titleStyle,
      this.hintColor,
      this.passSecure,
      this.radius = 22,
      this.maxLines = 1,
      this.fillColor = Colors.white,
      this.borderSide =
          const BorderSide(color: ColorManager.secondaryColor, width: 1)});

  final String? prefixImg, suffixImg, title, hint, helper;
  final BorderSide? borderSide;
  final int? maxLines, maxLength;
  final Color? fillColor, contentColor, activeBorderColor, hintColor;
  final double? radius, fontSize, height, width;
  final FontWeight? fontWeight;
  final TextEditingController? controller;
  final bool? enabled, readOnly;
  final Widget? suffixIcon, prefixIcon;
  final void Function()? onTap;
  final String? Function(String? value)? validator;
  final InputBorder? inputBorder;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Input? inputType;
  final RxBool? passSecure;
  final EdgeInsets? padding, contentPadding;
  final TextAlign? textAlign;
  final TextStyle? titleStyle;
  final void Function(String)? onSubmitted, onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            (title ?? '').tr,
            style: titleStyle ?? Get.textTheme.titleSmall,
          ),
        ],
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.fromLTRB(0, 2, 0, 12),
            child: SizedBox(
              height: height,
              width: width,
              child: Obx(() => TextFormField(
                    scrollPadding: const EdgeInsets.only(bottom: 30, top: 40),
                    controller: controller,
                    cursorColor: ColorManager.primaryColor,
                    obscureText: (passSecure ?? false.obs).value,
                    maxLines: maxLines,
                    maxLength: inputsMaxLength[inputType] ?? maxLength,
                    validator: validator,
                    readOnly: readOnly ?? false,
                    textInputAction: textInputAction ??
                        (maxLines == 1
                            ? TextInputAction.next
                            : TextInputAction.newline),
                    style: TextStyle(
                        color: contentColor,
                        fontSize: fontSize,
                        fontWeight: fontWeight),
                    keyboardType: keyboardType,
                    inputFormatters: keyboardType == TextInputType.number
                        ? [FilteringTextInputFormatter.digitsOnly]
                        : maxLength != null || inputType != null
                            ? [
                                LengthLimitingTextInputFormatter(
                                  inputsMaxLength[inputType] ?? maxLength,
                                )
                              ]
                            : [],
                    textAlign: textAlign ?? TextAlign.start,
                    onFieldSubmitted: onSubmitted,
                    onChanged: onChanged,
                    onSaved: onSaved,
                    decoration: InputDecoration(
                        enabled: onTap == null ? enabled ?? true : false,
                        border: inputBorder ?? border(borderSide),
                        enabledBorder: inputBorder ?? border(borderSide),
                        focusedBorder: inputBorder ??
                            border(BorderSide(
                                color: activeBorderColor ??
                                    ColorManager.primaryColor)),
                        errorBorder: inputBorder ??
                            border(BorderSide(
                                color: activeBorderColor ??
                                    ColorManager.errorColor)),
                        disabledBorder: inputBorder ??
                            border(BorderSide(
                                color: activeBorderColor ??
                                    ColorManager.primaryColor)),
                        filled: true,
                        fillColor: fillColor ?? Colors.transparent,
                        prefixIcon: prefixImg != null
                            ? Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                    'assets/images/icons/$prefixImg.svg',
                                    color: contentColor),
                              )
                            : prefixIcon,
                        suffixIcon: suffixImg != null
                            ? Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  'assets/images/icons/$suffixImg.svg',
                                  color: contentColor,
                                ),
                              )
                            : inputType == Input.password
                                ? IconButton(
                                    onPressed: () =>
                                        passSecure!(!passSecure!.value),
                                    color: ColorManager.primaryColor,
                                    icon: SvgPicture.asset(
                                      'assets/images/icons/${passSecure!.value ? 'hide-password' : 'show-password'}.svg',
                                    ),
                                  )
                                : suffixIcon,
                        helperText: helper,
                        hintText: hint,
                        counterText: '',
                        contentPadding: contentPadding ??
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                        hintStyle: Get.textTheme.titleSmall!.copyWith(
                            color: hintColor ?? ColorManager.lightGreyColor,
                            fontSize: fontSize,
                            fontWeight: fontWeight)),
                  )),
            ),
          ),
        ),
      ],
    );
  }

  final Map<Input, int> inputsMaxLength = {
    Input.text: 30,
    Input.phone: 10,
    Input.notes: 200,
  };

  OutlineInputBorder border(BorderSide? borderSide) => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: borderSide ??
            const BorderSide(
              width: .5,
              color: ColorManager.greyColor,
            ),
      );
}

enum Input { password, text, phone, notes }
