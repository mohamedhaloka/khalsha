import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/item_model.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';
import 'package:khalsha/features/widgets/inputs/toggle_item_with_holder.dart';

import '../../../core/service_utils.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

class ChooseShippingServiceView
    extends GetView<ChooseShippingServiceController> {
  const ChooseShippingServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            Text(
              'تحديد خدمة الشحن',
              textAlign: TextAlign.center,
              style: Get.textTheme.titleMedium!.copyWith(
                color: ColorManager.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 35),
              child: Text(
                'قم بإختيار نوع خدمة الشحن من شحن محلي أو دولي',
                textAlign: TextAlign.center,
                style: Get.textTheme.titleSmall!.copyWith(
                  color: ColorManager.greyColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  HeadLineBottomSheet(
                    bottomSheetTitle: 'الشحن المحلي',
                    height: 150,
                    body: ToggleItemWithHolder(
                      title: 'حدد مجال الشحنة',
                      items: shippingFieldOptions,
                      selectedItem: (-1).obs,
                      onChooseItem: (ItemModel item) {
                        Get.back();
                        if (item.id == 0) {
                          Get.toNamed(Routes.personalDomesticLandShipping);
                        } else {
                          Get.toNamed(Routes.commercialDomesticLandShipping);
                        }
                      },
                    ),
                  ),
                );
              },
              child: const Text('الشحن المحلي'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  HeadLineBottomSheet(
                    bottomSheetTitle: 'الشحن الدولي',
                    height: 150,
                    body: ToggleItemWithHolder(
                      title: 'حدد نوع البضاعة',
                      items: controller.itemsType,
                      selectedItem: (-1).obs,
                      onChooseItem: (ItemModel item) {
                        Get.back();
                        if (item.id == 0) {
                          Get.toNamed(
                            Routes.internationalBulkGoodsLandShipping,
                          );
                        } else {
                          Get.toNamed(
                            Routes.internationalPrivateTransferLandShipping,
                          );
                        }
                      },
                    ),
                  ),
                );
              },
              child: const Text('الشحن الدولي'),
            ),
          ],
        ),
      ),
    );
  }
}
