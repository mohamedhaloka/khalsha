import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

class AdsSlider extends StatefulWidget {
  const AdsSlider(this.photos, {Key? key}) : super(key: key);
  final List<String> photos;

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  int _pos = 0;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (t) {
      if (widget.photos.isNotEmpty) {
        int imgLength = widget.photos.length;
        _pos = (_pos + 1) % imgLength;

        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 150,
      decoration: const BoxDecoration(
        color: ColorManager.primaryColor,
        image: DecorationImage(
          image: ExactAssetImage('assets/images/banner.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  void dispose() {
    try {
      _timer!.cancel();
    } catch (_) {}
    try {
      _timer = null;
    } catch (_) {}
    super.dispose();
  }
}
