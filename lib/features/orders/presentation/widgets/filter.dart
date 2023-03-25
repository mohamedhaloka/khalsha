import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
    this.margin,
  }) : super(key: key);
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 95,
          margin: margin ?? const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: ColorManager.greyColor)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('شحن بري'),
              const SizedBox(width: 4),
              SvgPicture.asset('assets/images/icons/filter.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
