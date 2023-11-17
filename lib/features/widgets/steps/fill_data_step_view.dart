import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class FillDataStepView extends StatelessWidget {
  const FillDataStepView({
    Key? key,
    required this.serviceName,
    required this.image,
    required this.body,
  }) : super(key: key);
  final String serviceName;
  final String image;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'بيانات خدمة ${serviceName.tr}',
            style: Get.textTheme.bodyMedium!.copyWith(
              color: ColorManager.greyColor,
            ),
          ),
        ),
        SvgPicture.asset(
          'assets/images/intro_services/$image.svg',
        ),
        body
      ],
    );
  }
}
