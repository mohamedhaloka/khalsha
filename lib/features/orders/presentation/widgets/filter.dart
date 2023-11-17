import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
    required this.selectedService,
    this.margin,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  final EdgeInsets? margin;
  final String selectedService;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          margin: margin ?? const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: ColorManager.greyColor)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(selectedService.tr),
              const SizedBox(width: 4),
              SvgPicture.asset('assets/images/icons/filter.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
