import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class OrderSendSuccessfullyStepView extends StatelessWidget {
  const OrderSendSuccessfullyStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/order-send-successfully.svg',
        ),
        const SizedBox(height: 20),
        Text(
          'إرسال الطلب',
          textAlign: TextAlign.center,
          style: Get.textTheme.titleLarge!.copyWith(
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Center(
          child: Container(
            width: 100,
            height: 2,
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
            color: ColorManager.primaryColor,
          ),
        ),
        Text(
          'بمجرد إرسالك للطلب سوف يتم تزويدك بعروض أسعار مناسبة لك في أقرب وقت..',
          textAlign: TextAlign.center,
          style: Get.textTheme.titleMedium,
        ),
      ],
    );
  }
}
