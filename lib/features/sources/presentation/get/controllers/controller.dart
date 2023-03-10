import 'package:get/get.dart';

import '../../../../../core/models/item_model.dart';

class SourcesController extends GetxController {
  List<ItemModel> sources = const <ItemModel>[
    ItemModel(
      image: 'container-types',
      text: 'أنواع الحاويات',
    ),
    ItemModel(
      image: 'cost-and-shipping',
      text: 'التكلفة و الشحن CFR',
    ),
    ItemModel(
      image: 'air-transport-containers',
      text: 'حاويات النقل الجوي',
    ),
    ItemModel(
      image: 'packing-plans',
      text: 'خطط التعبئة',
    ),
    ItemModel(
      image: 'ballet-sizes',
      text: 'أحجام الباليتات',
    ),
    ItemModel(
      image: 'dangerous-goods',
      text: 'البضائع الخطرة',
    ),
  ];
}
