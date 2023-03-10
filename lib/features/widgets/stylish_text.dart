import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

class TextUnderline extends StatelessWidget {
  const TextUnderline(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: Get.textTheme.headline6!.copyWith(
            color: ColorManager.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 120,
          height: 2,
          margin: const EdgeInsets.only(top: 6),
          color: ColorManager.secondaryColor,
        )
      ],
    );
  }
}

class TextDash extends StatelessWidget {
  const TextDash(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "- ${text.tr} -",
      textAlign: TextAlign.center,
      style: Get.textTheme.headline5!.copyWith(
        color: ColorManager.secondaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
