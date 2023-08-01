import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/custom_rich_text.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/data/models/item_model.dart';
import '../../../core/presentation/routes/app_routes.dart';
import '../../../core/presentation/themes/colors_manager.dart';
import '../../../core/utils.dart' as util;
import '../../widgets/custom_button.dart';
import 'get/controllers/controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Text(
              'إنشاء حساب جديد',
              style: Get.textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _RegisterTabs(
            data: controller.tabs,
            currentTab: controller.currentTab,
          ),
          CustomTextField(
            title: 'الإسم',
            controller: controller.name,
          ),
          CustomTextField(
            title: 'البريد الإلكتروني',
            controller: controller.email,
          ),
          CustomTextField(
            title: 'كلمة السر',
            inputType: Input.password,
            passSecure: controller.passSecure,
            controller: controller.password,
          ),
          CustomTextField(
            title: 'تأكيد كلمة السر',
            inputType: Input.password,
            passSecure: controller.passConfirmationSecure,
            controller: controller.passwordConfirmation,
          ),
          CustomTextField(
            title: 'رقم الهاتف',
            inputType: Input.phone,
            controller: controller.phone,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
            child: CustomButton.fillBlue(
              width: Get.width,
              loading: controller.loading,
              onTap: controller.register,
              text: 'تسجيل',
            ),
          ),
          CustomRichText(
            text: 'لديك حساب الفعل؟ ',
            subText: 'الدخول',
            onTap: () => Get.offAllNamed(Routes.login),
          )
        ],
      ),
    );
  }
}

class _RegisterTabs extends StatelessWidget {
  const _RegisterTabs({
    Key? key,
    required this.currentTab,
    required this.data,
  }) : super(key: key);
  final List<ItemModel> data;
  final RxInt currentTab;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 236,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 2),
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 30),
        decoration: const BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Obx(() => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: data.map((item) {
                bool selected = currentTab.value == item.id;
                return InkWell(
                  onTap: () {
                    if (item.id == 1) {
                      util.showDialog(
                        'يمكنك تحميل تطبيق مقدم الخدمة والإستفاده بكافة مميزاته',
                        doneText: 'تحميل',
                        onDoneTapped: () {
                          final storeUrl = Uri.parse(
                              'https://play.google.com/store/apps/details?id=com.app.khalsha.provider');
                          launchUrl(
                            storeUrl,
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        backColor: ColorManager.secondaryColor,
                      );
                      return;
                    }

                    currentTab(item.id);
                  },
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color:
                          selected ? Colors.white : ColorManager.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        item.text,
                        style: Get.textTheme.bodySmall!.copyWith(
                            color: selected
                                ? ColorManager.primaryColor
                                : Colors.white),
                      ),
                    ),
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
