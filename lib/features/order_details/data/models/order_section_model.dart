import 'package:khalsha/core/data/models/item_model.dart';

class OrderSectionModel {
  final String title;
  final List<ItemModel> data;
  OrderSectionModel({required this.data, required this.title});
}
