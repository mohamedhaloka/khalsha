import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../widgets/inputs/service_item_with_holder.dart';
import '../get/controllers/controller.dart';

class AttachFilesStepView extends GetView<AddEditCustomsClearanceController> {
  const AttachFilesStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
            SvgPicture.asset(
              'assets/images/fill_service_steps/attach-files.svg',
            ),
            const SizedBox(height: 20),
            Text(
              'رجاء ارفاق الملفات الاتية',
              textAlign: TextAlign.center,
              style: Get.textTheme.titleLarge!.copyWith(
                color: ColorManager.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            ServiceItemWithHolder(
              height: 200,
              title: 'الفاتورة التجارية',
              text: controller.commercialInvoice.value.fileName,
              onTap: () async {
                final result = await pickFile();
                if (result == null) return;
                controller.commercialInvoice(File(result.path ?? ''));
              },
              onDelete: () => controller.commercialInvoice(File('')),
            ),
            ServiceItemWithHolder(
              height: 200,
              title: 'قائمة التعبئة',
              text: controller.packingList.value.fileName,
              onTap: () async {
                final result = await pickFile();
                if (result == null) return;
                controller.packingList(File(result.path ?? ''));
              },
              onDelete: () => controller.packingList(File('')),
            ),
            ServiceItemWithHolder(
              height: 200,
              title: 'شهادة المنشأ',
              text: controller.certificateOfOrigin.value.fileName,
              onTap: () async {
                final result = await pickFile();
                if (result == null) return;
                controller.certificateOfOrigin(File(result.path ?? ''));
              },
              onDelete: () => controller.certificateOfOrigin(File('')),
            ),
            ServiceItemWithHolder(
              height: 200,
              title: 'بوليصة الشحن',
              text: controller.billOfLading.value.fileName,
              onTap: () async {
                final result = await pickFile();
                if (result == null) return;
                controller.billOfLading(File(result.path ?? ''));
              },
              onDelete: () => controller.billOfLading(File('')),
            ),
          ],
        ));
  }

  Future<PlatformFile?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      return file;
    } else {
      return null;
    }
  }
}

extension FileName on File {
  String? get fileName {
    if (path != '') return 'تم';
    return null;
  }
}
