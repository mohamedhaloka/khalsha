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

  List<ItemModel> serviceTypes = const <ItemModel>[
    ItemModel(
      id: 0,
      text: 'الشحن المحلي',
      image: 'domestic_shipping',
    ),
    ItemModel(
      id: 1,
      text: 'الشحن الدولي',
      image: 'international_shipping',
    )
  ];
}
