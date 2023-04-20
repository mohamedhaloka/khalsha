import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/order_details/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/order_details/presentation/view.dart';
import 'package:khalsha/features/orders/data/models/order_model.dart';
import 'package:khalsha/features/widgets/add_photos.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/custom_drop_down.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

class ChangeOrderStatusSheet extends StatefulWidget {
  const ChangeOrderStatusSheet(this.stepModel, {Key? key}) : super(key: key);
  final OrderStepModel stepModel;

  @override
  State<ChangeOrderStatusSheet> createState() => _ChangeOrderStatusSheetState();
}

class _ChangeOrderStatusSheetState extends State<ChangeOrderStatusSheet> {
  RxString selectedStatus = ''.obs;
  TextEditingController notes = TextEditingController();
  RxList<File> images = <File>[].obs;

  RxBool loading = false.obs;

  final orderDetailsController = Get.find<OrderDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 15),
              children: [
                CustomTextField(
                  hint: 'أضف ملاحظات (أن وجد)',
                  maxLines: 3,
                  controller: notes,
                ),
                CustomDropDown(
                  dropVal: selectedStatus,
                  hint: 'حالة الطلب',
                  isExpanded: true,
                  source: [kDone, kPending]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                ),
                const Divider(),
                AddPhotos(images: images)
              ],
            ),
          ),
          CustomButton(
            width: Get.width,
            loading: loading,
            onTap: () async {
              loading(true);
              if (selectedStatus.value.isNotEmpty) {
                await orderDetailsController.updateOrderStatus(
                  comment: notes.text,
                  status: selectedStatus.value,
                  statusId: widget.stepModel.id,
                );
              }
              bool hasImagesAdded = images.any((element) => element.path != '');
              if (!hasImagesAdded) {
                loading(false);
                return;
              }
              await orderDetailsController.uploadImages(
                statusId: widget.stepModel.id,
                images: images,
              );
              loading(false);
              Get.back();
              orderDetailsController.getOrderDetails();
            },
            text: 'تأكيد',
          ),
        ],
      ),
    );
  }
}
