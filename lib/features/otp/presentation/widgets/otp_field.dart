import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../get/controllers/controller.dart';

class OTPFields extends GetView<OTPController> {
  const OTPFields(
      {this.inactiveColor,
      this.cursorColor,
      this.textStyle,
      this.onCompleted,
      Key? key})
      : super(key: key);

  final Color? inactiveColor, cursorColor;
  final TextStyle? textStyle;
  final void Function(String value)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          controller: controller.code,
          appContext: context,
          length: 4,
          obscureText: false,
          autoFocus: true,
          animationType: AnimationType.fade,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            inactiveColor: inactiveColor ?? ColorManager.primaryColor,
            shape: PinCodeFieldShape.box,
            fieldHeight: 60,
            fieldWidth: 60,
            borderRadius: BorderRadius.circular(12),
            borderWidth: 1,
            activeFillColor: Colors.grey[100],
            selectedColor: Colors.transparent,
            activeColor: Colors.transparent,
            inactiveFillColor: Colors.transparent,
            selectedFillColor: Colors.grey[300],
          ),
          cursorColor: cursorColor ?? ColorManager.primaryColor,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
          textStyle: textStyle,
          enableActiveFill: true,
          onCompleted: onCompleted,
          onChanged: (_) => _,
        ),
      ),
    );
  }
}
