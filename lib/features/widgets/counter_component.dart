import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/inputs_style.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

class CounterComponent extends StatefulWidget {
  const CounterComponent({
    Key? key,
    required this.number,
    required this.title,
    this.hint,
  }) : super(key: key);
  final String title;
  final String? hint;
  final RxInt number;

  @override
  State<CounterComponent> createState() => _CounterComponentState();
}

class _CounterComponentState extends State<CounterComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorManager.greyColor,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              CustomButton(
                onTap: () {
                  widget.number.value++;
                  setState(() {});
                },
                text: '+',
                radius: radius,
                width: inputHeight,
                height: inputHeight,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: inputHeight,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(radius)),
                    border: Border.all(
                      color: ColorManager.greyColor,
                      width: .5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${widget.number.value}${widget.hint ?? ''}',
                    style: Get.textTheme.bodySmall!.copyWith(
                      color: ColorManager.greyColor,
                    ),
                  ),
                ),
              ),
              CustomButton(
                onTap: () {
                  if (widget.number.value == 0) return;
                  widget.number.value--;
                  setState(() {});
                },
                text: '-',
                radius: radius,
                width: inputHeight,
                height: inputHeight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
