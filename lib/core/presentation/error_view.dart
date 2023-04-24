import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.details, {Key? key}) : super(key: key);
  final FlutterErrorDetails details;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SvgPicture.asset('assets/images/error_view.svg'),
    );
  }
}
