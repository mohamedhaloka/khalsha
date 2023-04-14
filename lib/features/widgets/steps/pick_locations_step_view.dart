import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PickLocationsStepView extends GetView {
  const PickLocationsStepView({
    Key? key,
    required this.children,
  }) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/pick-locations.svg',
        ),
        const SizedBox(height: 20),
        Column(
          children: children,
        ),
      ],
    );
  }
}
