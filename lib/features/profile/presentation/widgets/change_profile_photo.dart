import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

class ChangeProfilePhoto extends StatelessWidget {
  const ChangeProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: Get.width,
            height: 130,
            color: ColorManager.lightGreyColor,
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const CircleAvatar(
                    radius: 65,
                  ),
                ),
                Text('تغيير الصورة الشخصية')
              ],
            ),
          )
        ],
      ),
    );
  }
}
