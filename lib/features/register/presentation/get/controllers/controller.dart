import 'dart:io';

import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';

class RegisterController extends GetxController {
  List<ItemModel> tabs = const <ItemModel>[
    ItemModel(text: 'مستورد/مصدر', id: 0),
    ItemModel(text: 'مقدم خدمات لوجيستية', id: 1),
  ];

  List<ItemModel> socials = const <ItemModel>[
    ItemModel(text: 'Apple', image: 'apple'),
    ItemModel(text: 'Google', image: 'google'),
    ItemModel(text: 'Facebook', image: 'facebook'),
  ];

  RxInt currentTab = 0.obs;
  RxBool passSecure = true.obs;

  Rx<File> commercialRegisterFile = File('').obs;
}
