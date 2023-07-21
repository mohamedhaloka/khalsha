import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../headline_bottom_sheet.dart';
import 'input_holder_box.dart';

class CheckerWithHolder extends StatelessWidget {
  const CheckerWithHolder({
    Key? key,
    required this.title,
    required this.active,
    this.errotText,
    this.bottomSheetTitle,
    this.body,
    this.height,
  }) : super(key: key);
  final String? title, errotText;
  final RxBool active;
  final String? bottomSheetTitle;
  final Widget? body;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title ?? '',
              style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.greyColor,
              ),
            ),
          ),
          Center(
            child: Obx(() => CustomButton(
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (body == null) {
                      active(!active.value);
                      return;
                    }
                    final result = await Get.bottomSheet(
                      HeadLineBottomSheet(
                        height: height,
                        body: body!,
                        bottomSheetTitle: bottomSheetTitle ?? '',
                      ),
                      isScrollControlled: true,
                    );
                    if (result == null) return;
                    active(result);
                  },
                  width: inputHeight + 20,
                  height: inputHeight,
                  radius: radius,
                  borderColor: contentColor,
                  backgroundColor:
                      active.value ? Get.theme.primaryColor : Colors.white,
                  contentColor: active.value ? Colors.white : null,
                  text: active.value ? 'نعم' : 'لا',
                )),
          )
        ],
      ),
      errorText: errotText,
    );
  }
}

class FlammableMaterialsSheet extends StatelessWidget {
  const FlammableMaterialsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: [
        CustomTextField(
          title: 'اذكر المواد القابلة للإشتعال الموودة بشحنتك',
          maxLines: 4,
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        const SizedBox(height: 20),
        Center(
          child: CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              Get.back(result: true);
            },
          ),
        )
      ],
    );
  }
}
