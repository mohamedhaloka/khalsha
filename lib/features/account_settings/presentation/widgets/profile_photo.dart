import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';

import '../get/controllers/controller.dart';

class ProfilePhoto extends GetView<AccountSettingsController> {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorManager.primaryColor),
      ),
      child: Obx(
        () => InkWell(
          onTap: chooseImage,
          child: Image.file(controller.profilePhoto.value),
        ),
      ),
    );
  }

  void chooseImage() async {
    XFile? result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result == null) return;
    controller.profilePhoto(File(result.path));
  }
}
