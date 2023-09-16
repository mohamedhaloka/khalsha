import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/account_settings/presentation/widgets/profile_photo.dart';
import 'package:khalsha/features/widgets/choose_file.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

TextStyle _titleStyle = Get.textTheme.titleSmall!.copyWith(
  color: ColorManager.primaryColor,
  fontWeight: FontWeight.bold,
);

class AccountSettingsView extends GetView<AccountSettingsController> {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'إعدادات الحساب',
        ),
        body: Obx(
          () => Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const ProfilePhoto(),
                  CustomTextField(
                    title: 'الإسم بالكامل',
                    titleStyle: _titleStyle,
                    controller: controller.name,
                  ),
                  CustomTextField(
                    title: 'رقم الجوال',
                    titleStyle: _titleStyle,
                    controller: controller.phone,
                  ),
                  CustomTextField(
                    title: 'البريد الإلكتروني',
                    titleStyle: _titleStyle,
                    controller: controller.email,
                    helper:
                        'في حال تغيير البريد الإلكتروني سيتحتم عليك تغييره مره أخرى',
                  ),
                  CustomTextField(
                    title: 'نبذه',
                    hint: 'اكتب نبذة عنك',
                    controller: controller.bio,
                    titleStyle: _titleStyle,
                    maxLines: 3,
                  ),
                  const _SectionTitle('هل أنت شركة ؟'),
                  CustomTextField(
                    title: 'الرقم الضريبي',
                    titleStyle: _titleStyle,
                    helper:
                        'يجب عليك إرفاق السجل التجاري إذا كتبت الرقم الضريبي',
                  ),
                  ChooseFile(
                    title: 'إرفاق السجل التجاري',
                    hint: 'إختيار السجل التجاري',
                    file: controller.commercialCertificate,
                    titleStyle: _titleStyle,
                    helper:
                        'إذا قمت برفع ملف السجل التجاري سيتم وضع حسابك تحت مراجعة الإدارة',
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'حفظ التعديل',
                    onTap: controller.updateAccount,
                    loading: controller.loading,
                    width: Get.width,
                  ),
                  const _SectionTitle('تغيير كلمة المرور'),
                  CustomTextField(
                    title: 'كلمة المرور الحالية',
                    titleStyle: _titleStyle,
                    inputType: Input.password,
                    passSecure: false.obs,
                    controller: controller.oldPassword,
                  ),
                  CustomTextField(
                    title: 'كلمة المرور الجديدة',
                    titleStyle: _titleStyle,
                    inputType: Input.password,
                    passSecure: false.obs,
                    controller: controller.newPassword,
                  ),
                  CustomTextField(
                    title: 'تأكيد كلمة المرور الجديدة',
                    titleStyle: _titleStyle,
                    inputType: Input.password,
                    passSecure: false.obs,
                    controller: controller.confirmNewPassword,
                    helper:
                        'سيتم تسجيل الخروج من الحساب في حال تغيير كلمة المرور',
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    text: 'تغيير كلمة المرور',
                    onTap: controller.changePassword,
                    loading: controller.loading,
                    width: Get.width,
                  ),
                  const Divider(),
                  CustomButton(
                    text: 'حذف الحساب',
                    onTap: controller.deleteAccount,
                    loading: controller.loading,
                    width: Get.width,
                  ),
                ],
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
          ),
        ));
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Divider(
          color: ColorManager.greyColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: [
              const Expanded(
                  child: Divider(
                color: ColorManager.secondaryColor,
                thickness: 3,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  text,
                  style: Get.textTheme.titleLarge!.copyWith(
                    color: ColorManager.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Expanded(
                  child: Divider(
                color: ColorManager.secondaryColor,
                thickness: 3,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
