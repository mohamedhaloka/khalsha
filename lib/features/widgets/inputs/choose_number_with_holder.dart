import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_button.dart';
import 'input_holder_box.dart';

class ChooseNumberWithHolder extends StatelessWidget {
  const ChooseNumberWithHolder({
    Key? key,
    required this.title,
    required this.currentNumber,
  }) : super(key: key);
  final RxInt currentNumber;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        children: [
          Expanded(
            child: Text(
              title,
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
                    currentNumber.value++;
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
                      currentNumber.value.toString(),
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: ColorManager.greyColor,
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  onTap: () {
                    if (currentNumber.value == 0) return;
                    currentNumber.value--;
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
