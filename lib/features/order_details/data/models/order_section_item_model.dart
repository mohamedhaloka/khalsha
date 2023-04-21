import 'order_details_item_model.dart';

class OrderSectionItemModel {
  final String title;
  final List<OrderDetailsItemModel> data;
  OrderSectionItemModel({required this.data, required this.title});
}
