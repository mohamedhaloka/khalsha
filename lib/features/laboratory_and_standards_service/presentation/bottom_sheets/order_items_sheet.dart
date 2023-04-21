import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/models/order_item_model.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/inputs/attach_file_with_holder.dart';
import 'package:khalsha/features/widgets/inputs/text_field_input_with_holder.dart';

import '../../../widgets/inputs/drop_down_input_with_holder.dart';
import '../../laboratory.dart';

class OrderItemsSheet
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const OrderItemsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                itemBuilder: (_, int index) => Column(
                  children: [
                    TextFieldInputWithHolder(
                      title: 'اسم الصنف باللغة العربيه',
                      controller: controller.orderItems[index].nameAr,
                    ),
                    TextFieldInputWithHolder(
                      title: 'اسم الصنف باللغة الإنجليزية',
                      controller: controller.orderItems[index].nameEn,
                    ),
                    TextFieldInputWithHolder(
                      title: 'الرمز الجمركي',
                      controller: controller.orderItems[index].customsCode,
                    ),
                    TextFieldInputWithHolder(
                      title: 'اسم المصنع/ المورد',
                      controller: controller.orderItems[index].factoryName,
                    ),
                    DropDownInputWithHolder(
                      title: 'الغرض من الخدمة',
                      dropValue: controller.orderItems[index].itemServiceId,
                      source: controller.services
                          .map((element) => DropdownMenuItem(
                                value: element.id.toString(),
                                child: Text(element.name),
                              ))
                          .toList(),
                    ),
                    AttachFileWithHolder(
                      title: 'صورة من البطاقة الإضاحية',
                      file: controller.orderItems[index].photoCard,
                    ),
                    AttachFileWithHolder(
                      title: 'صورة الصنف',
                      file: controller.orderItems[index].photoItem,
                    ),
                    if (controller.orderItems.length > 1)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomButton(
                          width: 40,
                          height: 40,
                          onTap: () => controller.orderItems
                              .remove(controller.orderItems[index]),
                          imgName: 'delete',
                          backgroundColor: ColorManager.errorColor,
                        ),
                      ),
                  ],
                ),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: controller.orderItems.length,
              ),
            ),
          ),
          Row(
            children: [
              const Expanded(child: Divider(color: ColorManager.primaryColor)),
              InkWell(
                  onTap: () => controller.orderItems.add(
                        OrderItemModel.newItem(),
                      ),
                  child: const Chip(label: Text('إضافة صنف جديد +'))),
              const Expanded(child: Divider(color: ColorManager.primaryColor)),
            ],
          ),
          const SizedBox(height: 20),
          CustomButton(
            height: 50,
            width: Get.width,
            onTap: () {
              bool hasEmptyData = false;

              for (var element in controller.orderItems) {
                if (element.nameEn.text.isEmpty ||
                    element.nameAr.text.isEmpty ||
                    element.photoItem.value.path == '' ||
                    element.photoCard.value.path == '' ||
                    element.itemServiceId.value == '' ||
                    element.factoryName.text.isEmpty ||
                    element.customsCode.text.isEmpty) {
                  hasEmptyData = true;
                  break;
                }
              }

              Get.back(result: hasEmptyData);
            },
            text: 'تأكيد',
          )
        ],
      ),
    );
  }
}
