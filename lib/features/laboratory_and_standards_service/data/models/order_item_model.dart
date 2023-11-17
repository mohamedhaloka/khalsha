import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderItemModel {
  final TextEditingController nameAr, nameEn, customsCode, factoryName;
  final RxString itemServiceId;
  final Rx<File> photoCard, photoItem;

  const OrderItemModel({
    required this.customsCode,
    required this.factoryName,
    required this.itemServiceId,
    required this.nameAr,
    required this.nameEn,
    required this.photoCard,
    required this.photoItem,
  });

  factory OrderItemModel.newItem() => OrderItemModel(
        customsCode: TextEditingController(),
        factoryName: TextEditingController(),
        itemServiceId: ''.obs,
        nameAr: TextEditingController(),
        nameEn: TextEditingController(),
        photoCard: File('').obs,
        photoItem: File('').obs,
      );
}
