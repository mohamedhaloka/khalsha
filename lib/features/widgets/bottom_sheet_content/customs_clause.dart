import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_button.dart';

class CustomsClause extends StatelessWidget {
  const CustomsClause({
    Key? key,
    required this.customsClause,
  }) : super(key: key);
  final RxList<TextEditingController> customsClause;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.separated(
                itemBuilder: (_, int index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'البند الجمركي',
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: ColorManager.greyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                radius: radius,
                                contentColor: contentColor,
                                controller: customsClause[index],
                              ),
                            ),
                            const SizedBox(width: 10),
                            CustomButton(
                              width: 50,
                              height: 50,
                              onTap: () =>
                                  customsClause.remove(customsClause[index]),
                              imgName: 'delete',
                              backgroundColor: ColorManager.errorColor,
                            )
                          ],
                        ),
                      ],
                    ),
                separatorBuilder: (_, __) => const Divider(
                      color: ColorManager.greyColor,
                    ),
                itemCount: customsClause.length)),
          ),
          Row(
            children: [
              const Expanded(
                  child: Divider(
                color: ColorManager.greyColor,
              )),
              InkWell(
                onTap: () => customsClause.add(TextEditingController()),
                child: const Chip(
                  label: Text(
                    'أضف بند أخر     +',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: ColorManager.primaryColor,
                ),
              ),
              const Expanded(
                  child: Divider(
                color: ColorManager.greyColor,
              )),
            ],
          ),
          CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
