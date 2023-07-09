import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import 'get/controllers/controller.dart';

class RuleView extends GetView<RuleController> {
  const RuleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pageTitle.tr),
      ),
      body: Obx(
        () => controller.loading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Get.theme.primaryColor,
                ),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: HtmlWidget(controller.rule?.content ?? ''),
              ),
      ),
    );
  }
}
