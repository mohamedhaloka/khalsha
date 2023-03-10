import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

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
            'عبد الحميد مصطفي',
            style: Get.textTheme.subtitle1!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'مستورد',
            style: Get.textTheme.subtitle2!.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
