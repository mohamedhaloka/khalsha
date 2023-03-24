import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/inputs_style.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../widgets/counter_component.dart';

class SetNumberCount extends StatelessWidget {
  const SetNumberCount({
    Key? key,
    required this.number,
    required this.title,
  }) : super(key: key);
  final String title;
  final RxInt number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CounterComponent(
            title: title,
            number: number,
          ),
          CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              // number(count);
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
