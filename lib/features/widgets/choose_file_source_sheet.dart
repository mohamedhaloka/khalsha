import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

class ChooseFileSourceSheet extends StatelessWidget {
  const ChooseFileSourceSheet({super.key, required this.onChooseFiles});
  final void Function(List<File> files) onChooseFiles;

  @override
  Widget build(BuildContext context) {
    return HeadLineBottomSheet(
      bottomSheetTitle: 'قم بإختيار مصدر الصور',
      body: Column(
        children: [
          ListTile(
            onTap: () async {
              XFile? imageFile = await ImagePicker().pickImage(
                source: ImageSource.camera,
                imageQuality: 30,
                maxWidth: 350,
                maxHeight: 350,
              );

              if (imageFile == null) return;

              final int imageSize = await imageFile.length();

              if (imageSize > 4000000) {
                showAlertMessage('photo-must-be-smaller-than-4mb');
                return;
              }

              Get.back();
              onChooseFiles([File(imageFile.path)]);
            },
            leading: const Icon(
              Icons.camera_alt_outlined,
              color: ColorManager.primaryColor,
            ),
            title: const Text('الكاميرا'),
          ),
          ListTile(
            onTap: () async {
              final files = await _pickFiles();
              if (files == null) return;
              Get.back();
              onChooseFiles(files.map((e) => File(e.path!)).toList());
            },
            leading: const Icon(
              Icons.file_copy_outlined,
              color: ColorManager.primaryColor,
            ),
            title: const Text('الملفات'),
          ),
        ],
      ),
      height: 250,
    );
  }

  Future<List<PlatformFile>?> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowCompression: true,
    );

    if (result != null) {
      List<PlatformFile> files = result.files;

      // for (var element in files) {
      //   print('file size ${element.size}');
      // }

      if (files.any((element) => element.size > 2000000)) {
        showAlertMessage('file-must-be-smaller-than-2mb');
        return null;
      }

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
