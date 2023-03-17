import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/themes/colors_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onTap,
      this.text,
      this.loading,
      this.width,
      this.imgName,
      this.radius,
      this.height,
      this.contentColor,
      this.backgroundColor})
      : super(key: key);

  const CustomButton.fillBlue(
      {Key? key,
      required this.onTap,
      this.text,
      this.loading,
      this.width,
      this.imgName,
      this.radius,
      this.height,
      this.contentColor = Colors.white,
      this.backgroundColor = ColorManager.primaryColor})
      : super(key: key);
  final void Function()? onTap;
  final String? text;
  final String? imgName;
  final Color? backgroundColor, contentColor;
  final RxBool? loading;
  final double? width, height, radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      width: width,
      child: Obx(
        () => ElevatedButton(
          onPressed: (loading ?? false.obs).value ? null : onTap,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
            ),
            backgroundColor: backgroundColor ?? Colors.white,
            foregroundColor: ColorManager.primaryColor,
            side: const BorderSide(
              color: ColorManager.greyColor,
              width: .5,
            ),
            elevation: 0.0,
          ),
          child: (loading ?? false.obs).value
              ? Center(
                  child: CircularProgressIndicator(
                  color: Get.theme.primaryColor,
                ))
              : imgName != null && text != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          (text ?? '').tr,
                          style: Get.textTheme.bodyText2!.copyWith(
                            color: contentColor ?? Colors.black,
                          ),
                        ),
                        SvgPicture.asset('assets/images/icons/$imgName.svg'),
                      ],
                    )
                  : imgName != null
                      ? SvgPicture.asset(
                          'assets/images/icons/$imgName.svg',
                        )
                      : Text(
                          (text ?? '').tr,
                          style: Get.textTheme.bodyText2!.copyWith(
                            color: contentColor ?? Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
        ),
      ),
    );
  }
}
