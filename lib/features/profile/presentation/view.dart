import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/profile/presentation/widgets/change_profile_photo.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../../widgets/custom_text_field.dart';
import 'get/controllers/controller.dart';

const _contentPadding = EdgeInsets.symmetric(horizontal: 12);
const _borderColor = BorderSide(color: ColorManager.greyColor);

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ChangeProfilePhoto(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Column(
            children: [
              CustomTextField(
                title: 'الإسم',
                contentPadding: _contentPadding,
                borderSide: _borderColor,
              ),
              CustomTextField(
                title: 'البريد الإلكتروني',
                contentPadding: _contentPadding,
                borderSide: _borderColor,
              ),
              CustomTextField(
                title: 'رقم الهاتف',
                contentPadding: _contentPadding,
                borderSide: _borderColor,
              ),
              CustomTextField(
                title: 'السجل التجاري',
                contentPadding: _contentPadding,
                borderSide: _borderColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: CustomButton(
                  width: Get.width,
                  height: 36,
                  radius: 6,
                  onTap: () {},
                  text: 'تعديل',
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
