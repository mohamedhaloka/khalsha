import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContainerDataModel {
  final RxString goodsType, containerType, containerSize;
  final TextEditingController containerCount;

  ContainerDataModel({
    required this.containerSize,
    required this.goodsType,
    required this.containerCount,
    required this.containerType,
  });

  factory ContainerDataModel.newItem() => ContainerDataModel(
      containerSize: ''.obs,
      goodsType: ''.obs,
      containerType: ''.obs,
      containerCount: TextEditingController());
}
