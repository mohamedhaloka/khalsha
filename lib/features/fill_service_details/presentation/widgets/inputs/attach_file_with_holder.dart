import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/inputs_style.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import 'input_holder_box.dart';

class AttachFileWithHolder extends StatelessWidget {
  const AttachFileWithHolder({Key? key, this.title}) : super(key: key);
  final String? title;

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
              onTap: () {},
              child: Center(
                child: Container(
                  height: inputHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.lightGreyColor),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(radius)),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icons/upload-file.svg'),
                      const SizedBox(width: 6),
                      const Text(
                        'إرفاق',
                        style: TextStyle(
                          color: ColorManager.greyColor,
                        ),
                      ),
                    ],
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
