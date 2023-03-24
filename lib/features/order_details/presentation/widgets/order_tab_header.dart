import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/themes/colors_manager.dart';

class OrderTabHeader extends StatelessWidget {
  const OrderTabHeader({
    Key? key,
    required this.hint,
    required this.title,
  }) : super(key: key);
  final String title, hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineSmall!.copyWith(
            color: ColorManager.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          hint,
          textAlign: TextAlign.center,
          style: Get.textTheme.titleSmall!.copyWith(
            color: ColorManager.greyColor,
          ),
        ),
      ],
    );
  }
}
