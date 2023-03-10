import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';

class LoginController extends GetxController {
  List<ItemModel> socials = const <ItemModel>[
    ItemModel(text: 'Google', image: 'google'),
    ItemModel(text: 'Facebook', image: 'facebook'),
  ];

  RxBool passSecure = true.obs;
}
