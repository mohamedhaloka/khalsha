import 'package:flutter/material.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class InputHolderBox extends StatelessWidget {
  const InputHolderBox(
    this.input, {
    Key? key,
    this.padding,
    this.errorText,
  }) : super(key: key);
  final Widget input;
  final EdgeInsets? padding;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          input,
          if (errorText != null)
            Text(
              errorText ?? '',
              style: const TextStyle(color: ColorManager.errorColor),
            )
        ],
      ),
    );
  }
}
