import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/presentation/routes/app_routes.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import 'get/controllers/controller.dart';

class BillDetailsView extends GetView<BillDetailsController> {
  const BillDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'فاتورة الطلب رقم #${controller.settlementModel.id}',
      ),
      bottomNavigationBar: SizedBox(
        height: Get.previousRoute == Routes.settlementDetails ? 150 : 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              CustomButton(
                text: 'مشاركة',
                width: Get.width,
                onTap: () => Get.toNamed(Routes.billDetails),
              ),
              if (Get.previousRoute == Routes.settlementDetails) ...[
                const SizedBox(height: 10),
                CustomButton.fillBlue(
                  text: 'دفع التسوية',
                  width: Get.width,
                  onTap: () => Get.back(),
                ),
              ]
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        // child: Bill(),
      ),
    );
  }
}
