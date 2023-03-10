import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: 38,
      height: 38,
      radius: 8,
      backgroundColor: Colors.white,
      onTap: onTap ?? Get.back,
      imgName: 'arrow-left',
    );
  }
}
