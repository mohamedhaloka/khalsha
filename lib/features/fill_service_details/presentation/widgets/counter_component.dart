import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../widgets/custom_button.dart';
import '../inputs_style.dart';

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
  int count = 0;

  @override
  void initState() {
    count = widget.number.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
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
                    count++;
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
                      '$count${widget.hint ?? ''}',
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: ColorManager.greyColor,
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  onTap: () {
                    if (count == 0) return;
                    count--;
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
      ),
    );
  }
}
