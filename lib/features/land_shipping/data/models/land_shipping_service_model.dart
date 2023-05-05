import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LandShippingServiceModel {
  final TextEditingController item, quantity;
  final RxBool pack, unpack, packaging;

  LandShippingServiceModel({
    required this.item,
    required this.quantity,
    required this.packaging,
    required this.pack,
    required this.unpack,
  });

  factory LandShippingServiceModel.newItem() => LandShippingServiceModel(
        item: TextEditingController(),
        quantity: TextEditingController(),
        packaging: false.obs,
        pack: false.obs,
        unpack: false.obs,
      );
}
