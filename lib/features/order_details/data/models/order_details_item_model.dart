class OrderDetailsItemModel {
  final String? title, description;
  final OrderDetailsTypes? type;
  OrderDetailsItemModel({
    required this.title,
    this.description,
    this.type = OrderDetailsTypes.none,
  });
}

enum OrderDetailsTypes {
  none,
  file,
}
