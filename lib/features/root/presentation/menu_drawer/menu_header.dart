import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/local/user_local.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 190,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: ColorManager.primaryColor,
        image: DecorationImage(
          image: ExactAssetImage('assets/images/menu/header.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset('assets/images/menu/user-circle.svg'),
          const SizedBox(height: 14),
          Text(
            UserDataLocal.instance.clientName,
            style: Get.textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          // Text(
          //   'مستورد/مصدر',
          //   style: Get.textTheme.titleSmall!.copyWith(
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}
