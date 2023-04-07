import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdditionalServiceStepView extends StatelessWidget {
  const AdditionalServiceStepView({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          'assets/images/fill_service_steps/additional_service.svg',
        ),
        const SizedBox(height: 20),
        body,
      ],
    );
  }
}
