import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ParcelDataModel {
  final RxString goodsType, parcelType;
  final TextEditingController totalSize, totalWeight, quantity, otherParcelName;

  ParcelDataModel({
    required this.quantity,
    required this.goodsType,
    required this.totalSize,
    required this.totalWeight,
    required this.parcelType,
    required this.otherParcelName,
  });

  factory ParcelDataModel.newItem() => ParcelDataModel(
      quantity: TextEditingController(),
      goodsType: ''.obs,
      totalSize: TextEditingController(),
      totalWeight: TextEditingController(),
      parcelType: ''.obs,
      otherParcelName: TextEditingController());
}
