import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/order_details/presentation/bottom_sheets/change_order_status_sheet.dart';
import 'package:khalsha/features/order_details/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/order_details/presentation/view.dart';
import 'package:khalsha/features/orders/data/models/order_model.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

import '../../../../core/data/services/http_service.dart';

class OrderStatusSteps extends GetView<OrderDetailsController> {
  const OrderStatusSteps({
    Key? key,
    required this.steps,
  }) : super(key: key);
  final List<OrderStepModel> steps;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 15),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, int index) => _OrderStep(
        steps[index],
        controller: controller,
      ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: steps.length,
    );
  }
}

class _OrderStep extends StatelessWidget {
  const _OrderStep(
    this.stepModel, {
    Key? key,
    required this.controller,
  }) : super(key: key);
  final OrderStepModel stepModel;
  final OrderDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: stepModel.status == kDone
          ? null
          : () {
              Get.bottomSheet(
                HeadLineBottomSheet(
                  bottomSheetTitle: stepModel.step,
                  height: Get.height / 1.5,
                  body: ChangeOrderStatusSheet(stepModel),
                ),
                isScrollControlled: true,
              );
            },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              color: stepModel.status == kDone
                  ? ColorManager.secondaryColor
                  : ColorManager.primaryColor,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  stepModel.step.tr,
                  style: Get.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: stepModel.status == kDone
                        ? ColorManager.secondaryColor
                        : ColorManager.primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  stepModel.status.tr,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            Text(stepModel.user.name),
            if (stepModel.files.isNotEmpty) ...[
              const Divider(),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                ),
                itemCount: stepModel.files.length,
                itemBuilder: (_, int index) => Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.lightGreyColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22)),
                        image: DecorationImage(
                          image: NetworkImage(
                              '${HttpService.imageBaseURL}${stepModel.files[index].fullPath}'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Center(
                        child: Icon(CupertinoIcons.photo),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: InkWell(
                        onTap: () async {
                          // loading(true);
                          await controller.deleteImage(
                            stepModel.files[index].id,
                          );
                          Get.back();
                          // loading(false);
                        },
                        child: const CircleAvatar(
                          radius: 8,
                          backgroundColor: ColorManager.errorColor,
                          child: Icon(Icons.clear, size: 10),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
