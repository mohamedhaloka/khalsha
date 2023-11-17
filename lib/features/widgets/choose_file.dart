import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class ChooseFile extends StatelessWidget {
  const ChooseFile({
    Key? key,
    required this.title,
    required this.hint,
    required this.file,
    this.titleStyle,
    this.helper,
  }) : super(key: key);
  final String? helper;
  final String title, hint;
  final Rx<File> file;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          style: titleStyle ?? Get.textTheme.titleSmall,
        ),
        InkWell(
          onTap: chooseFile,
          child: Container(
            height: 55,
            margin: const EdgeInsets.fromLTRB(0, 2, 0, 12),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: .5, color: ColorManager.greyColor)),
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                    () => Text(
                      file.value.path == ''
                          ? hint
                          : file.value.path.split('/').last,
                      style: Get.textTheme.titleSmall!.copyWith(
                        color: ColorManager.greyColor,
                      ),
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/icons/upload-file.svg',
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            helper ?? '',
            style: Get.textTheme.labelMedium!.copyWith(
              color: ColorManager.greyColor,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile pickedFile = result.files.first;
      file(File(pickedFile.path!));
    }
  }
}
