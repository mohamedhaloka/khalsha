import 'package:flutter/material.dart';

class InputHolderBox extends StatelessWidget {
  const InputHolderBox(
    this.input, {
    Key? key,
    this.padding,
  }) : super(key: key);
  final Widget input;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
      ),
      child: input,
    );
  }
}
