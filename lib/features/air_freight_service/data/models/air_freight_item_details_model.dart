import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AirFreightItemModel {
  final RxInt unitType;
  final TextEditingController name,
      length,
      height,
      weightPerUnit,
      width,
      cm,
      quantity;
  final Rx<File> image;

  const AirFreightItemModel({
    required this.name,
    required this.length,
    required this.width,
    required this.height,
    required this.image,
    required this.quantity,
    required this.cm,
    required this.unitType,
    required this.weightPerUnit,
  });

  factory AirFreightItemModel.nexItem() => AirFreightItemModel(
        name: TextEditingController(),
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
