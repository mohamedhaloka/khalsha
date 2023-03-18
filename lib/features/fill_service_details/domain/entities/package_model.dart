import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PackageModel {
  final TextEditingController goodsDescription,
      height,
      weight,
      size,
      width,
      quantity,
      length;
  final RxInt packageType;
  const PackageModel(
      {required this.length,
      required this.height,
      required this.width,
      required this.weight,
      required this.size,
      required this.quantity,
      required this.goodsDescription,
      required this.packageType});

  factory PackageModel.newItem() => PackageModel(
        length: TextEditingController(),
        height: TextEditingController(),
        weight: TextEditingController(),
        size: TextEditingController(),
        width: TextEditingController(),
        quantity: TextEditingController(),
        goodsDescription: TextEditingController(),
        packageType: 0.obs,
      );
}
