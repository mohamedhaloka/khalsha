import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/service_item_with_holder.dart';

import '../../../../core/themes/colors_manager.dart';

class AttachFilesStepView extends StatelessWidget {
  const AttachFilesStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/attach-files.svg',
        ),
        const SizedBox(height: 20),
        Text(
          'رجاء ارفاق الملفات الاتية',
          textAlign: TextAlign.center,
          style: Get.textTheme.titleLarge!.copyWith(
            color: ColorManager.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Wrap(
            children: [
              'الفاتورة التجارية',
              'قائمة التعبئة',
              'شهادة المنشأ',
              'بوليصة الشحن',
            ]
                .map((e) => SizedBox(
                      width: Get.width / 2.3,
                      height: 40,
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: ColorManager.greyColor,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        const ServiceItemWithHolder(
          height: 200,
          title: 'أضف الملفات',
          bottomSheetTitle: 'أضف الملفات',
          body: Text('Attach Files'),
        )
      ],
    );
  }
}
