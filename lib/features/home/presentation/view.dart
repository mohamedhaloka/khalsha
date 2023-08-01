import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/home/presentation/widgets/ads_slider.dart';
import 'package:khalsha/features/home/presentation/widgets/grid_services.dart';
import 'package:khalsha/features/home/presentation/widgets/home_header.dart';

import 'get/controllers/controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          right: 0,
          left: 0,
          child: SvgPicture.asset(
            'assets/images/waves.svg',
            fit: BoxFit.fill,
          ),
        ),
        ListView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          children: const [
            KhalshaVideo(),
            HomeHeader(),
            GridServices(),
          ],
        ),
      ],
    );
  }
}
