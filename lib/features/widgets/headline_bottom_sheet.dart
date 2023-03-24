import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

class HeadLineBottomSheet extends StatelessWidget {
  const HeadLineBottomSheet({
    Key? key,
    this.height,
    required this.bottomSheetTitle,
    required this.body,
  }) : super(key: key);
  final Widget body;
  final double? height;
  final String bottomSheetTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/icons/bottom-sheet-swapper.svg'),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                        color: ColorManager.primaryColor,
                      ),
                      child: Text(
                        bottomSheetTitle,
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: body,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
