import 'package:flutter/cupertino.dart';

class ItemModel {
  final int? id, statusId;
  final String text;
  final String? image, description, route;
  final Widget? child;
  final Object? arguments;
  final bool? mainItem;
  const ItemModel({
    this.id,
    this.statusId,
    required this.text,
    this.route,
    this.image,
    this.arguments,
    this.description,
    this.mainItem,
    this.child,
  });

  factory ItemModel.empty() => const ItemModel(text: '');
}
