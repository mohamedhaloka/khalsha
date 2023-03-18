import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/fill_service_details/domain/entities/package_model.dart';

import '../../../../core/models/item_model.dart';
import '../../../widgets/custom_button.dart';
import '../inputs_style.dart';
import '../widgets/inputs/text_field_input_with_holder.dart';
import '../widgets/inputs/toggle_item_with_holder.dart';

class AddShippingSize extends StatelessWidget {
  const AddShippingSize({
    Key? key,
    required this.packages,
    required this.items,
    required this.onAdd,
  }) : super(key: key);

  final RxList<PackageModel> packages;
  final List<ItemModel> items;
  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => Column(
              children: [
                const Divider(),
                TextFieldInputWithHolder(
                  title: 'وصف البضاعة',
                  controller: packages[index].goodsDescription,
                ),
                const Divider(),
                ToggleItemWithHolder(
                  title: 'نوع الطرد',
                  items: items,
                  selectedItem: packages[index].packageType,
                ),
                const Divider(),
                Text(
                  'ابعاد الشحنة بالسم',
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: ColorManager.greyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldInputWithHolder(
                        hint: 'طول',
                        controller: packages[index].weight,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFieldInputWithHolder(
                        hint: 'عرض',
                        controller: packages[index].weight,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFieldInputWithHolder(
                        hint: 'ارتفاع',
                        controller: packages[index].weight,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFieldInputWithHolder(
                        hint: 'الكمية',
                        controller: packages[index].weight,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFieldInputWithHolder(
                          title: 'الوزن',
                          controller: packages[index].weight,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextFieldInputWithHolder(
                          title: 'الحجم',
                          controller: packages[index].size,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            separatorBuilder: (_, __) => const Divider(
              color: ColorManager.greyColor,
            ),
            itemCount: packages.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
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
    );
  }
}
