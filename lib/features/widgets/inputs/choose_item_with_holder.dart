import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import 'input_holder_box.dart';

class ChooseItemWithHolder extends StatelessWidget {
  const ChooseItemWithHolder({
    Key? key,
    this.title,
    this.height,
    required this.bottomSheetTitle,
    required this.selectedItem,
    required this.body,
  }) : super(key: key);
  final String? title;
  final String bottomSheetTitle;
  final Rx<DataModel> selectedItem;
  final Widget body;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        children: [
          if (title != null) ...[
            Text(
              title ?? '',
              style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.greyColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset('assets/images/icons/info.svg'),
              ),
            ),
          ],
          Expanded(
            child: InkWell(
              onTap: () => Get.bottomSheet(
                HeadLineBottomSheet(
                  height: height,
                  body: body,
                  bottomSheetTitle: bottomSheetTitle,
                ),
                isScrollControlled: true,
              ),
              child: Container(
                height: inputHeight,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(radius)),
                  border: Border.all(color: ColorManager.lightGreyColor),
                ),
                child: Obx(
                  () => Text(
                    selectedItem.value.name,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
