import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GoodsTotalShipmentMarineShipmentModel {
  final TextEditingController totalWeight, overallSize, quantity;

  const GoodsTotalShipmentMarineShipmentModel({
    required this.totalWeight,
    required this.overallSize,
    required this.quantity,
  });

  factory GoodsTotalShipmentMarineShipmentModel.nexItem() =>
      GoodsTotalShipmentMarineShipmentModel(
        totalWeight: TextEditingController(),
        overallSize: TextEditingController(),
        quantity: TextEditingController(),
      );
}

class GoodsUnitTypeMarineShipmentModel {
  final RxInt unitType;
  final TextEditingController length,
      height,
      weightPerUnit,
      width,
      cm,
      quantity;
  final Rx<File> image;

  const GoodsUnitTypeMarineShipmentModel({
    required this.length,
    required this.width,
    required this.height,
    required this.image,
    required this.quantity,
    required this.cm,
    required this.unitType,
    required this.weightPerUnit,
  });

  factory GoodsUnitTypeMarineShipmentModel.nexItem() =>
      GoodsUnitTypeMarineShipmentModel(
        length: TextEditingController(),
        width: TextEditingController(),
        height: TextEditingController(),
        image: File('').obs,
        quantity: TextEditingController(),
        cm: TextEditingController(),
        unitType: 0.obs,
        weightPerUnit: TextEditingController(),
      );
}
