import 'package:flutter/cupertino.dart';

class CustomsClauseModel {
  final TextEditingController firstItem, secondItem;
  const CustomsClauseModel({
    required this.firstItem,
    required this.secondItem,
  });

  factory CustomsClauseModel.newItem() => CustomsClauseModel(
        firstItem: TextEditingController(),
        secondItem: TextEditingController(),
      );
}
