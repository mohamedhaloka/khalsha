import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/orders/presentation/widgets/filter.dart';
import 'package:khalsha/features/statistics/presentation/widgets/chart_statistics.dart';
import 'package:khalsha/features/statistics/presentation/widgets/data_summary.dart';
import 'package:khalsha/features/statistics/presentation/widgets/periods_statistic.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/headline_bottom_sheet.dart';
import '../../widgets/services_filtration_sheet.dart';
import 'get/controllers/controller.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'إحصائياتي',
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        children: [
          Filter(
            onTap: () => Get.bottomSheet(
              HeadLineBottomSheet(
                bottomSheetTitle: 'فلترة الإحصائيات',
                body: ServicesFiltrationSheet(
                  'إحصائيات خدمة',
                  selectedService: controller.selectedService,
                  onDoneTapped: () {},
                ),
                height: Get.height / 2.2,
              ),
            ),
          ),
          const PeriodsStatistic(),
          const ChartStatistics(),
          DataSummary(
            selectedFilter: 0.obs,
            filters: controller.postsFilters,
          ),
          DataSummary(
            selectedFilter: 0.obs,
            filters: controller.offersFilters,
          ),
        ],
      ),
    );
  }
}
