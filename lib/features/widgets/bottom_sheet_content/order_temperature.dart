import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/inputs_style.dart';
import 'package:khalsha/features/widgets/counter_component.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

class OrderTemperature extends StatelessWidget {
  const OrderTemperature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        CounterComponent(
          number: 0.obs,
          title: 'درجة الحرارة أعلى من',
          hint: 'F',
        ),
        const Divider(
          color: ColorManager.greyColor,
          height: 50,
        ),
        CounterComponent(
          number: 0.obs,
          title: 'درجة الحرارة أقل من',
          hint: 'F',
        ),
        const Divider(
          color: ColorManager.greyColor,
          height: 50,
        ),
        const SizedBox(height: 20),
        Center(
          child: CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              Get.back();
            },
          ),
        )
      ],
    );
  }
}
