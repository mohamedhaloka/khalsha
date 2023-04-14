import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../counter_component.dart';
import '../custom_button.dart';

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
