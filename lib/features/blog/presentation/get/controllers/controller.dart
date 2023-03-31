import 'package:get/get.dart';

import '../../../../../core/data/models/item_model.dart';

class BlogController extends GetxController {
  List<ItemModel> posts = const <ItemModel>[
    ItemModel(
      image: '1',
      text: 'الشحن الجوي للملكة السعودية',
    ),
    ItemModel(
      image: '2',
      text: 'الشحن البحري للمملكة السعودية',
    ),
    ItemModel(
      image: '3',
      text: 'الشحن البري للمملكة السعودية',
    ),
    ItemModel(
      image: '4',
      text: 'المستودعات للمملكة السعودية',
    ),
    ItemModel(
      image: '2',
      text: 'الشحن البحري للمملكة السعودية',
    ),
    ItemModel(
      image: '3',
      text: 'الشحن البري للمملكة السعودية',
    ),
    ItemModel(
      image: '4',
      text: 'المستودعات للمملكة السعودية',
    ),
  ];
}
