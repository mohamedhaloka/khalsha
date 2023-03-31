import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/inputs_style.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/custom_drop_down.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../core/presentation/routes/app_routes.dart';
import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

class SettlementDetailsView extends GetView<SettlementDetailsController> {
  const SettlementDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تسوية الطلب رقم #3',
      ),
      bottomNavigationBar: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              CustomButton(
                text: 'عرض الفاتورة',
                width: Get.width,
                onTap: () => Get.toNamed(Routes.billDetails),
              ),
              const SizedBox(height: 10),
              CustomButton.fillBlue(
                text: 'دفع التسوية',
                width: Get.width,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'ادخل بيانات بطاقتك',
              style: Get.textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomTextField(
            title: 'رقم البطاقة',
            borderSide: inputBorderSide,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  title: 'تاريخ الإنتهاء',
                  borderSide: inputBorderSide,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomTextField(
                  title: 'CVV',
                  borderSide: inputBorderSide,
                ),
              ),
            ],
          ),
          CustomTextField(
            title: 'اسم صاحب البطاقة',
            borderSide: inputBorderSide,
          ),
          CustomDropDown(
            title: 'عنوان وصول الفواتير',
            dropVal: ''.obs,
            source: [].obs,
            isExpanded: true,
            radius: 10,
          )
        ],
      ),
    );
  }
}
