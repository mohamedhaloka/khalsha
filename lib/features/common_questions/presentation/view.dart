import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/data/models/item_model.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/custom_app_bar.dart';
import 'package:khalsha/features/common_questions/presentation/get/controllers/controller.dart';

class CommonQuestionsView extends GetView<CommonQuestionsController> {
  const CommonQuestionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الأسئلة الشائعة'),
      body: ListView.separated(
          itemBuilder: (_, int index) => _QuestionItem(
                controller.commonQuestions[index],
              ),
          separatorBuilder: (_, __) => const Divider(
                color: ColorManager.greyColor,
              ),
          itemCount: controller.commonQuestions.length),
    );
  }
}

class _QuestionItem extends StatelessWidget {
  const _QuestionItem(this.itemModel, {Key? key}) : super(key: key);
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemModel.text,
            style: Get.textTheme.titleMedium!.copyWith(
              color: ColorManager.secondaryColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            itemModel.description ?? '',
            style: Get.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
