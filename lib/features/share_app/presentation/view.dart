import 'package:custom_qr_generator/colors/color.dart';
import 'package:custom_qr_generator/options/colors.dart';
import 'package:custom_qr_generator/options/options.dart';
import 'package:custom_qr_generator/qr_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/services/http_service.dart';
import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

class ShareAppView extends GetView<ShareAppController> {
  const ShareAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'شارك خلصها'),
      body: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              margin: const EdgeInsets.all(14),
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: ColorManager.primaryColor,
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(12),
                child: CustomPaint(
                  painter: QrPainter(
                    data: HttpService.websiteURL,
                    options: const QrOptions(
                      colors: QrColors(
                        dark: QrColorLinearGradient(
                          colors: [
                            ColorManager.primaryColor,
                            ColorManager.secondaryColor,
                          ],
                          orientation: GradientOrientation.leftDiagonal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              height: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: ColorManager.primaryColor,
              ),
              child: Center(
                child: Text(
                  'أفحص الكود',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
