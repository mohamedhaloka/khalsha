import 'package:flutter/cupertino.dart';

class ItemModel {
  final int? id;
  final String text;
  final String? image, description, route;
  final Widget? child;
  final Object? arguments;
  const ItemModel({
    this.id,
    required this.text,
    this.route,
    this.image,
    this.arguments,
    this.description,
    this.child,
  });

  factory ItemModel.empty() => const ItemModel(
        text: '',
      );
}
