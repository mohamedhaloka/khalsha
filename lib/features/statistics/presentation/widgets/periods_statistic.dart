import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/statistics/presentation/get/controllers/controller.dart';

import '../../../../core/inputs_style.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

class PeriodsStatistic extends GetView<StatisticsController> {
  const PeriodsStatistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStatisticItems(),
        _buildStatisticItems(),
      ],
    );
  }

  Container _buildStatisticItems() => Container(
        height: 82,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(child: _buildStatisticItem()),
            Expanded(child: _buildStatisticItem()),
          ],
        ),
      );

  Widget _buildStatisticItem() => Row(
        children: [
          Container(
            height: 60,
            width: 1,
            color: ColorManager.lightGreyColor,
            margin: const EdgeInsets.only(right: 5, left: 20),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3,000 ريال',
                style: Get.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'أرباح اليوم',
                style: Get.textTheme.bodySmall!.copyWith(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '0.49%+',
                      style: Get.textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                        color: ColorManager.greyColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '6.1',
                        style: Get.textTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          color: ColorManager.greyColor,
                        ),
                      ),
                      SvgPicture.asset('assets/images/icons/arrow-up.svg')
                    ],
                  )
                ],
              )
            ],
          )),
        ],
      );
}
