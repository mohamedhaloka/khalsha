import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/inputs_style.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../../../../core/themes/colors_manager.dart';

class SetNumberCount extends StatefulWidget {
  const SetNumberCount({
    Key? key,
    required this.number,
    required this.title,
  }) : super(key: key);
  final String title;
  final RxInt number;

  @override
  State<SetNumberCount> createState() => _SetNumberCountState();
}

class _SetNumberCountState extends State<SetNumberCount> {
  int count = 0;

  @override
  void initState() {
    count = widget.number.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
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
                            count.toString(),
                            style: Get.textTheme.bodySmall!.copyWith(
                              color: ColorManager.greyColor,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        onTap: () {
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
          ),
          CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              widget.number(count);
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
