import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';

import 'package:khalsha/features/account_settings/presentation/get/controllers/controller.dart';

class ProfilePhoto extends GetView<AccountSettingsController> {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorManager.primaryColor),
      ),
      child: Obx(
        () => Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: chooseImage,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  child: controller.profilePhoto.value.path.isEmpty
                      ? const Icon(
                          CupertinoIcons.person,
                          color: ColorManager.primaryColor,
                          size: 50,
                        )
                      : Image.file(
                          controller.profilePhoto.value,
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              if (controller.profilePhoto.value.path.isNotEmpty)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: controller.changeProfilePhoto,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorManager.primaryColor),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: ColorManager.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                )
            ],
          ),
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
