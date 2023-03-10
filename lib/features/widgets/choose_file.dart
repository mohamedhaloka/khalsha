import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/themes/colors_manager.dart';

class ChooseFile extends StatelessWidget {
  const ChooseFile({
    Key? key,
    required this.title,
    required this.hint,
    required this.file,
  }) : super(key: key);
  final String title, hint;
  final Rx<File> file;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          style: Get.textTheme.subtitle2,
        ),
        InkWell(
          onTap: chooseFile,
          child: Container(
            height: 55,
            margin: const EdgeInsets.fromLTRB(0, 2, 0, 12),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border:
                    Border.all(width: .5, color: ColorManager.lightGreyColor)),
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                    () => Text(
                      file.value.path == ''
                          ? hint
                          : file.value.path.split("/").last,
                      style: Get.textTheme.subtitle2!.copyWith(
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
