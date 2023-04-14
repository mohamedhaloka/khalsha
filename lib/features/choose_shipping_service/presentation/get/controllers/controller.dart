import 'package:get/get.dart';

import '../../../../../core/data/models/item_model.dart';

class ChooseShippingServiceController extends GetxController {
  List<ItemModel> itemsType = const <ItemModel>[
    ItemModel(
      text: 'بضائع مجمعة',
      id: 0,
    ),
    ItemModel(
      text: 'نقل خاص',
      id: 1,
    )
  ];
}
