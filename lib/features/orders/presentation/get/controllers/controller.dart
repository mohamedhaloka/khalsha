import 'package:get/get.dart';

import '../../../../../core/models/item_model.dart';

class OrdersController extends GetxController {
  List<ItemModel> orders = <ItemModel>[];

  @override
  void onInit() {
    orders = const [
      ItemModel(id: 0, text: '2800'),
      ItemModel(id: 1, text: '2100'),
      ItemModel(id: 2, text: '2000'),
      ItemModel(id: 3, text: '1500'),
      ItemModel(id: 4, text: '4000'),
      ItemModel(id: 5, text: '100'),
    ];
    super.onInit();
  }
}
