import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/file_model.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/land_shipping/land_shipping.dart';
import 'package:khalsha/features/widgets/choose_file_source_sheet.dart';
import 'package:khalsha/features/widgets/inputs/service_item_with_holder.dart';

class LandShippingAttachFilesStepView
    extends GetView<AddEditLandShippingServiceController> {
  const LandShippingAttachFilesStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
            SvgPicture.asset(
              'assets/images/fill_service_steps/attach-files.svg',
            ),
            const SizedBox(height: 20),
            Text(
              '*إرفاق صور الشحنة يساعدك بالحصول على افضل عرض سعر',
              style: Get.textTheme.bodySmall!.copyWith(
                color: ColorManager.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ServiceItemWithHolder(
              height: 200,
              title: 'أضف الملفات',
              bottomSheetTitle: 'أضف الملفات',
              text: controller.files.isEmpty ? null : 'تم',
              onTap: () => Get.bottomSheet(
                ChooseFileSourceSheet(
                  onChooseFiles: (files) {
                    for (var file in files) {
                      final fileMimeType = getFileType(file.path);
                      controller.files.add(FileModel(
                        file: File(file.path),
                        type: fileMimeType,
                      ));
                      controller.newFilesPath.add(file.path);
                    }
                  },
                ),
              ),
              onDelete: () => controller.files.clear(),
            ),
            Obx(() => GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: controller.files.length,
                  itemBuilder: (_, int index) => Stack(
                    children: [
                      if (controller.files[index].type.contains('image')) ...[
                        Image.file(
                          controller.files[index].file,
                          fit: BoxFit.cover,
                        ),
                      ] else ...[
                        Container(
                          width: Get.width,
                          height: Get.height,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.doc),
                              Text('file'.tr)
                            ],
                          ),
                        )
                      ],
                      Positioned(
                          child: InkWell(
                        onTap: () {
                          final file = controller.files[index];
                          controller.files.remove(file);
                          if (file.id == null) return;
                          controller.deletedFilesIds.add(file.id!);
                        },
                        child: const CircleAvatar(
                          radius: 8,
                          backgroundColor: ColorManager.errorColor,
                          child: Icon(
                            Icons.close,
                            size: 10,
                          ),
                        ),
                      )),
                    ],
                  ),
                ))
          ],
        ));
  }

  Future<List<PlatformFile>?> pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<PlatformFile> files = result.files;

      return files;
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
