import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';

import '../../../core/data/models/item_model.dart';
import '../../../core/presentation/routes/app_routes.dart';
import '../../../core/service_utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/headline_bottom_sheet.dart';
import '../../widgets/inputs/toggle_item_with_holder.dart';
import 'get/controllers/controller.dart';

class ChooseShippingServiceView
    extends GetView<ChooseShippingServiceController> {
  const ChooseShippingServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            Column(
              children: controller.serviceTypes
                  .map((e) => InkWell(
                        onTap: () {
                          if (e.id == 0) {
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
                                      Get.toNamed(
                                        Routes.personalDomesticLandShipping,
                                      );
                                    } else {
                                      Get.toNamed(
                                        Routes.commercialDomesticLandShipping,
                                      );
                                    }
                                  },
                                ),
                              ),
                            );
                          } else {
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
                                        Routes
                                            .internationalBulkGoodsLandShipping,
                                      );
                                    } else {
                                      Get.toNamed(
                                        Routes
                                            .internationalPrivateTransferLandShipping,
                                      );
                                    }
                                  },
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 140,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: 82,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(14)),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 4),
                                        color: Colors.grey[400]!,
                                        spreadRadius: 2,
                                        blurRadius: 5),
                                  ],
                                ),
                                alignment: Alignment.centerRight,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(14),
                                    bottomRight: Radius.circular(14),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/icons/oval_shape.svg',
                                        fit: BoxFit.fill,
                                      ),
                                      Positioned(
                                        right: 10,
                                        child: Text(
                                          e.text,
                                          style: Get.textTheme.titleLarge!
                                              .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 0,
                                bottom: 0,
                                child: SvgPicture.asset(
                                  'assets/images/icons/${e.image}.svg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
