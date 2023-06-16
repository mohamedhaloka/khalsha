import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

class DangerousGoodsSheet extends StatefulWidget {
  const DangerousGoodsSheet({Key? key}) : super(key: key);

  @override
  State<DangerousGoodsSheet> createState() => _DangerousGoodsSheetState();
}

class _DangerousGoodsSheetState extends State<DangerousGoodsSheet> {
  List<ItemModel> items = const <ItemModel>[
    ItemModel(image: 'explosives', text: 'متفجرات'),
    ItemModel(image: 'flammable-liquids', text: 'السوائل قابلة للإشتعال'),
    ItemModel(
        image: 'miscellaneous-dangerous-goods',
        text: 'البضائع الخطرة المتنوعة'),
    ItemModel(
        image: 'highly-flammable-solids', text: 'مواد صلبة سريعة الإشتعال'),
    ItemModel(
        image: 'oxidizing-agents', text: 'عوامل مؤكسدة وبيروكسيدات عضوية'),
    ItemModel(image: 'gases', text: 'غازات'),
    ItemModel(image: 'radioactive-materials', text: 'مواد مشعة'),
    ItemModel(image: 'corrosive-substances', text: 'المواد المسببة للتأكل'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          padding: const EdgeInsets.all(8),
          width: Get.width / 1.5,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: const Text(
            'المواد سريعة الاشتعال او الخطرة هي مواد أو عناصر ذات خصائص فيزيائية وكيميائية ، إذا لم يتم التحكم فيها بشكل صحيح ، فإنها تشكل خطراً محتملاً على صحة الإنسان وسلامته أو للبنية التحتية ومن الامثلة على هذه المواد :',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 40,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: ColorManager.secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                        'assets/images/flammable/${items[index].image}.svg'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    items[index].text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
