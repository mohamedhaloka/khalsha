import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class OrderTabHeader extends StatelessWidget {
  const OrderTabHeader({
    Key? key,
    required this.title,
    this.hint,
  }) : super(key: key);
  final String title;
  final String? hint;

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
        if (hint != null)
          Text(
            hint!,
            textAlign: TextAlign.center,
            style: Get.textTheme.titleSmall!.copyWith(
              color: ColorManager.greyColor,
            ),
          ),
      ],
    );
  }
}
