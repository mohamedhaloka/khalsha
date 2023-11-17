import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/features/profile/presentation/widgets/change_profile_photo.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';
import 'package:khalsha/features/profile/presentation/get/controllers/controller.dart';

const _contentPadding = EdgeInsets.symmetric(horizontal: 12);
const _borderColor = BorderSide(color: ColorManager.greyColor);

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            RefreshIndicator(
              onRefresh: controller.getProfileData,
              child: ListView(
                children: [
                  const ChangeProfilePhoto(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Column(
                      children: [
                        CustomTextField(
                          title: 'الإسم',
                          contentPadding: _contentPadding,
                          borderSide: _borderColor,
                          enabled: false,
                          controller: controller.name,
                        ),
                        CustomTextField(
                          title: 'البريد الإلكتروني',
                          contentPadding: _contentPadding,
                          borderSide: _borderColor,
                          enabled: false,
                          controller: controller.email,
                        ),
                        CustomTextField(
                          title: 'رقم الهاتف',
                          contentPadding: _contentPadding,
                          borderSide: _borderColor,
                          enabled: false,
                          controller: controller.phone,
                        ),
                        CustomTextField(
                          title: 'السجل التجاري',
                          contentPadding: _contentPadding,
                          borderSide: _borderColor,
                          enabled: false,
                          controller: controller.commercialCertificate,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: CustomButton(
                            width: Get.width,
                            height: 36,
                            radius: 6,
                            onTap: () => Get.toNamed(Routes.accountSettings),
                            text: 'تعديل',
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (controller.loading.value)
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  color: Colors.transparent,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
          ],
        ));
  }
}
