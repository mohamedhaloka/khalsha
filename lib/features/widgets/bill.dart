import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/data/models/item_model.dart';
import '../../core/presentation/themes/colors_manager.dart';

class Bill extends StatelessWidget {
  const Bill({
    Key? key,
    required this.items,
    required this.total,
    required this.orderId,
    required this.userName,
    required this.billCreatedDate,
    required this.userBio,
  }) : super(key: key);
  final String userName, userBio, orderId, billCreatedDate, total;
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.greyColor,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/icons/title-header.svg'),
                Text(
                  'فـــــاتــــورة',
                  style: Get.textTheme.headlineSmall!.copyWith(
                    color: ColorManager.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 2,
                  child:
                      SvgPicture.asset('assets/images/icons/title-header.svg'),
                )
              ],
            ),
          ),
          _separator,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Table(
                  border: TableBorder.all(
                    color: ColorManager.lightGreyColor,
                    width: 1.5,
                  ),
                  children: [
                    TableRow(children: [
                      _BillUserDetails(
                        title: 'الفاتورة بإسم:',
                        subTitle: userName,
                        hint: userBio,
                      ),
                      _BillUserDetails(
                        title: 'الفاتورة رقم:',
                        subTitle: '#$orderId',
                        hint: 'بتاريخ : $billCreatedDate',
                      ),
                      _BillUserDetails(
                        title: 'إجمالي الفاتورة:',
                        subTitle: total,
                        hint: 'دولار أمريكي',
                      ),
                    ])
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  margin: const EdgeInsets.only(top: 20, bottom: 6),
                  color: ColorManager.darkTobyColor,
                  child: Row(
                    children: const [
                      Expanded(
                          child: Text(
                        'العنصر',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Text(
                        'الإجابة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  itemBuilder: (_, int index) => Container(
                    color: (items[index].mainItem ?? false)
                        ? ColorManager.darkTobyColor
                        : null,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            items[index].text,
                            style: TextStyle(
                              color: (items[index].mainItem ?? false)
                                  ? Colors.white
                                  : null,
                              fontWeight: (items[index].mainItem ?? false)
                                  ? FontWeight.bold
                                  : null,
                            ),
                          ),
                        ),
                        Text(
                          items[index].description ?? '',
                          style: TextStyle(
                            color: (items[index].mainItem ?? false)
                                ? Colors.white
                                : null,
                            fontWeight: (items[index].mainItem ?? false)
                                ? FontWeight.bold
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (_, __) => const Divider(
                    color: ColorManager.lightGreyColor,
                    height: 0,
                  ),
                  itemCount: items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _separator => const Divider(
        color: ColorManager.greyColor,
        height: 0,
      );
}

class _BillUserDetails extends StatelessWidget {
  const _BillUserDetails({
    Key? key,
    required this.title,
    required this.hint,
    required this.subTitle,
  }) : super(key: key);
  final String title, subTitle, hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Get.textTheme.labelMedium!.copyWith(
              color: ColorManager.greyColor,
            ),
          ),
          Text(
            subTitle,
            style: Get.textTheme.titleMedium!.copyWith(
              color: ColorManager.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            hint,
            style: Get.textTheme.labelMedium!.copyWith(
              color: ColorManager.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
