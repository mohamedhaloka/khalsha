import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/fill_service_details/presentation/inputs_style.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../widgets/custom_button.dart';
import '../../domain/entities/customs_clause_model.dart';

class CustomsClause extends StatelessWidget {
  const CustomsClause({
    Key? key,
    required this.customsClause,
    required this.onAdd,
  }) : super(key: key);
  final RxList<CustomsClauseModel> customsClause;
  final void Function() onAdd;

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
                          'البند الأول',
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: ColorManager.greyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomTextField(
                          radius: radius,
                          contentColor: contentColor,
                        ),
                        Text(
                          'البند الأول',
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: ColorManager.greyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomTextField(
                          radius: radius,
                          contentColor: contentColor,
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
                onTap: onAdd,
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
