import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/home/data/models/statistics_model.dart';

class StatisticsDataSheet extends StatelessWidget {
  const StatisticsDataSheet(this.statisticModel, {Key? key}) : super(key: key);
  final ServiceStatisticModel statisticModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _statisticItem(
            label: 'all',
            number: statisticModel.all,
            borderColor: ColorManager.primaryColor,
          ),
          _statisticItem(
            label: 'open',
            number: statisticModel.open,
            borderColor: Colors.green,
          ),
          _statisticItem(
            label: 'closed',
            number: statisticModel.closed,
            borderColor: ColorManager.errorColor,
          ),
          _statisticItem(
            label: 'pending',
            number: statisticModel.pending,
            borderColor: Colors.yellow,
          ),
          _statisticItem(
            label: 'offers',
            number: statisticModel.offers,
            borderColor: ColorManager.secondaryColor,
          ),
          _statisticItem(
            label: 'invoices',
            number: statisticModel.invoices,
            borderColor: ColorManager.darkTobyColor,
          ),
        ],
      ),
    );
  }

  Widget _statisticItem({
    required String label,
    required int number,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            color: borderColor,
          )),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label.tr,
              style: Get.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            number.toString(),
            style: Get.textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
