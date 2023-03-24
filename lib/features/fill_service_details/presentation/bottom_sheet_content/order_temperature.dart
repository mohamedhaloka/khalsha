import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/counter_component.dart';

import '../../../widgets/custom_button.dart';
import '../inputs_style.dart';

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
        ),
        CounterComponent(
          number: 0.obs,
          title: 'درجة الحرارة أقل من',
          hint: 'F',
        ),
        const Divider(
          color: ColorManager.greyColor,
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
