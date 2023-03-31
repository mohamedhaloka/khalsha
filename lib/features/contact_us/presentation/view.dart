import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

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
          onTap: () {},
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
            title: 'الإسم',
            radius: _radius,
          ),
          CustomTextField(
            title: 'بريدك الإلكتروني',
            radius: _radius,
          ),
          CustomTextField(
            title: 'رسالتنا',
            maxLines: 6,
            radius: _radius,
          ),
        ],
      ),
    );
  }
}
