import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/themes/colors_manager.dart';

class Bill extends StatelessWidget {
  const Bill({Key? key}) : super(key: key);

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
                  children: const [
                    TableRow(children: [
                      _BillUserDetails(
                        title: 'الفاتورة بإسم:',
                        subTitle: 'محمود إبراهيم',
                        hint: 'مستورد أجهزة طبية',
                      ),
                      _BillUserDetails(
                        title: 'الفاتورة رقم:',
                        subTitle: '#345345',
                        hint: 'بتاريخ : 12/2/2022',
                      ),
                      _BillUserDetails(
                        title: 'إجمالي الفاتورة:',
                        subTitle: '12,000',
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
                  itemBuilder: (_, int index) => Row(
                    children: const [
                      Expanded(
                        child: Text('المخلص الجمركي'),
                      ),
                      Text('النبهان'),
                    ],
                  ),
                  separatorBuilder: (_, __) => const Divider(
                    color: ColorManager.lightGreyColor,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
          _separator,
          const _BillPricingDetails()
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

class _BillPricingDetails extends StatelessWidget {
  const _BillPricingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 40),
      child: Column(
        children: [
          _billPriceItemData(
            title: 'الإجمالي بدون الضريبة',
            price: '11.500',
          ),
          _billPriceItemData(
            title: 'إجمالي الضريبة',
            price: '500',
          ),
          _billPriceItemData(
            title: 'الإجمالي بعد الضريبة',
            price: '12.000',
            backgroundColor: ColorManager.darkTobyColor,
            contentColor: Colors.white,
            contentWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _billPriceItemData({
    required String title,
    required String price,
    Color? backgroundColor,
    Color? contentColor,
    FontWeight? contentWeight,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        margin: const EdgeInsets.symmetric(vertical: 2),
        color: backgroundColor,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: contentWeight,
                  color: contentColor,
                ),
              ),
            ),
            Text(
              '$price دولار أمريكي',
              style: TextStyle(
                fontWeight: contentWeight,
                color: contentColor,
              ),
            ),
          ],
        ),
      );
}
