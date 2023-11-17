import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContainerMarineShipmentModel {
  final RxString containerType;
  final TextEditingController containerContent;
  final Rx<File> file;
  final RxInt containerCount;

  const ContainerMarineShipmentModel({
    required this.containerCount,
    required this.file,
    required this.containerType,
    required this.containerContent,
  });

  factory ContainerMarineShipmentModel.nexItem() =>
      ContainerMarineShipmentModel(
        containerCount: 0.obs,
        file: File('').obs,
        containerType: ''.obs,
        containerContent: TextEditingController(),
      );
}
