import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_button.dart';
import '../inputs/text_field_input_with_holder.dart';

class StorageService extends StatelessWidget {
  const StorageService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) => Column(
            children: const [
              TextFieldInputWithHolder(
                title: 'اسم الصنف',
              ),
              Divider(
                color: ColorManager.greyColor,
              ),
              _ServiceYouNeed(),
              Divider(
                color: ColorManager.greyColor,
              ),
            ],
          ),
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemCount: 1,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'إضافة صنف أخر',
            contentColor: ColorManager.lightGreyColor,
            onTap: () {},
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              Get.back();
            },
          ),
        )
      ],
    );
  }
}

class _ServiceYouNeed extends StatelessWidget {
  const _ServiceYouNeed({Key? key}) : super(key: key);

  List<ItemModel> get services => const <ItemModel>[
        ItemModel(text: 'فك'),
        ItemModel(text: 'تغليف'),
        ItemModel(text: 'تركيب'),
      ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الخدمات التي تحتاجها',
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorManager.greyColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: services
                  .map((e) => Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border:
                                Border.all(color: ColorManager.lightGreyColor)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 4,
                        ),
                        child: Text(e.text),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
