import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_button.dart';
import '../inputs/text_field_input_with_holder.dart';

class AddLocationSheet extends StatelessWidget {
  const AddLocationSheet({
    Key? key,
    required this.items,
  }) : super(key: key);
  final RxList<int> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.separated(
                  itemBuilder: (_, int index) => Column(
                    children: [
                      const TextFieldInputWithHolder(
                        title: 'الموقع',
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      const TextFieldInputWithHolder(
                        title: 'وصف الموقع',
                      ),
                      if (items.length > 1)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomButton(
                            width: 40,
                            height: 40,
                            onTap: () => items.remove(items[index]),
                            imgName: 'delete',
                            backgroundColor: ColorManager.errorColor,
                          ),
                        ),
                    ],
                  ),
                  separatorBuilder: (_, __) => const Divider(
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                  ),
                  itemCount: items.length,
                )),
          ),
          Row(
            children: [
              const Expanded(
                child: Divider(color: ColorManager.greyColor),
              ),
              InkWell(
                onTap: () => items.add(0),
                child: const Chip(
                  backgroundColor: ColorManager.primaryColor,
                  label: Text(
                    'إضافة موقع جديد  +',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Expanded(
                child: Divider(color: ColorManager.greyColor),
              ),
            ],
          ),
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
      ),
    );
  }
}
