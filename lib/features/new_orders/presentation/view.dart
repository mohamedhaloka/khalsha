import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/orders/presentation/widgets/filter.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';
import 'package:khalsha/features/widgets/services_filtration_sheet.dart';

import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

class NewOrdersView extends GetView<NewOrdersController> {
  const NewOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'الطلبات الجديدة',
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Filter(
            onTap: () => Get.bottomSheet(
              HeadLineBottomSheet(
                bottomSheetTitle: 'فلترة الطلبات',
                body: ServicesFiltrationSheet(
                  'طلبات خدمة',
                  selectedService: controller.selectedService,
                  onDoneTapped: () {},
                ),
                height: Get.height / 2.2,
              ),
            ),
          ),
          // TableItems(
          //   onItemTapped: () => Get.toNamed(Routes.settlementDetails),
          //   itemsHeader: const ['عنوان الطلب', 'بواسطة', ''],
          //   itemsBody: const ['نقل أخشاب', 'شركة الرياض', 'عرض الطلب'],
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              'يتم تسوية الفاتورة في حال تجاوزها مده لا تقل عن ثلاثين يوماً او في حال بلوغها الحد الإقصي وهو مائة ريال.',
              style: Get.textTheme.bodyText2!.copyWith(
                color: ColorManager.darkTobyColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
