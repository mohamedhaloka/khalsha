import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/custom_app_bar.dart';
import 'package:khalsha/features/contact_us/presentation/get/controllers/controller.dart';

const _radius = 8.0;

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الدعم للعملاء'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: CustomButton(
          onTap: controller.sendMessage,
          loading: controller.loading,
          text: 'ارسال',
          radius: _radius,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'ارسل لنا إستفسارك',
              style: Get.textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomTextField(
            title: 'عنوان الرساله',
            radius: _radius,
            controller: controller.title,
          ),
          CustomTextField(
            title: 'الإسم',
            radius: _radius,
            controller: controller.name,
          ),
          CustomTextField(
            title: 'بريدك الإلكتروني',
            radius: _radius,
            controller: controller.email,
          ),
          CustomTextField(
            title: 'رقم الهاتف',
            radius: _radius,
            controller: controller.mobile,
          ),
          CustomTextField(
            title: 'الرسالة',
            maxLines: 6,
            radius: _radius,
            controller: controller.message,
          ),
        ],
      ),
    );
  }
}
