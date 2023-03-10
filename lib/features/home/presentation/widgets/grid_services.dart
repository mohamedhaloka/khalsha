import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/home/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/home/presentation/widgets/service_item.dart';

import '../../../../core/utils/grid_delegate_fixed_height.dart';

class GridServices extends GetView<HomeController> {
  const GridServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2,
              crossAxisSpacing: 35.0,
              mainAxisSpacing: 35.0,
              height: 190),
      itemCount: controller.services.length,
      itemBuilder: (_, int index) => ServiceItem(controller.services[index]),
    );
  }
}
