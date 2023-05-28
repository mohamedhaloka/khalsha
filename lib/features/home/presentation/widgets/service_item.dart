import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/home/data/models/statistics_model.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../../core/presentation/routes/app_routes.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem(
    this.service, {
    required this.statistics,
    Key? key,
  }) : super(key: key);
  final ItemModel service;
  final Rx<StatisticsModel> statistics;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.serviceIntro,
          arguments: service.arguments,
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          color: ColorManager.primaryColor,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          'assets/images/services/${service.image}.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // if (statisticModel != null)
                    //   Positioned(
                    //     left: 0,
                    //     child: IconButton(
                    //       onPressed: () {
                    //         if (statisticModel == null) return;
                    //         Get.bottomSheet(
                    //           HeadLineBottomSheet(
                    //             bottomSheetTitle:
                    //             'إحصائيات طلبات خدمة ${service.text.toString().tr}',
                    //             body: StatisticsDataSheet(statisticModel!),
                    //             height: Get.height / 1.5,
                    //           ),
                    //           isScrollControlled: true,
                    //         );
                    //       },
                    //       icon: const Icon(Icons.info_outline),
                    //     ),
                    //   )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Text(
                  service.text,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ServiceStatisticModel? get statisticModel {
    ServiceTypes serviceTypes = service.arguments as ServiceTypes;
    switch (serviceTypes) {
      case ServiceTypes.customsClearance:
        return statistics.value.customClearance;
      case ServiceTypes.landShipping:
        return statistics.value.landShipping;
      case ServiceTypes.stores:
        return statistics.value.warehouse;
      case ServiceTypes.marineShipping:
        return statistics.value.seaShipping;
      case ServiceTypes.airFreight:
        return statistics.value.airShipping;
      case ServiceTypes.laboratoryAndStandards:
        return statistics.value.laboratory;
    }
  }
}
