import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdditionalServiceStepView extends StatelessWidget {
  const AdditionalServiceStepView({
    Key? key,
    required this.body,
    this.imagePath,
  }) : super(key: key);

  final Widget body;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          imagePath ??
              'assets/images/fill_service_steps/additional_service.svg',
        ),
        const SizedBox(height: 20),
        body,
      ],
    );
  }
}
