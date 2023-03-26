import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: margin ?? const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: ColorManager.greyColor)),
          child: SvgPicture.asset('assets/images/icons/filter.svg'),
        ),
      ),
    );
  }
}
