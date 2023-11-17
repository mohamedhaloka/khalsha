class OrderDetailsItemModel {
  final String? title, description, value;
  final OrderDetailsTypes type;
  final OrderDetailsAction action;
  final bool enableGesture;
  OrderDetailsItemModel({
    required this.title,
    this.description,
    this.value,
    this.enableGesture = false,
    this.type = OrderDetailsTypes.none,
    this.action = OrderDetailsAction.none,
  });
}

enum OrderDetailsTypes {
  none,
  file,
  mapDirection,
}

enum OrderDetailsAction {
  none,
  uploadFile,
}
