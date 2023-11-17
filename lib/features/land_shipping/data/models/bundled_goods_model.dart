import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BundledGoodsModel {
  final TextEditingController name, quantity, totalWeight;
  final RxString unit;
  final Rx<File> image;

  BundledGoodsModel({
    required this.image,
    required this.name,
    required this.totalWeight,
    required this.unit,
    required this.quantity,
  });

  factory BundledGoodsModel.newItem() => BundledGoodsModel(
        image: File('').obs,
        name: TextEditingController(),
        totalWeight: TextEditingController(),
        unit: ''.obs,
        quantity: TextEditingController(),
      );
}
