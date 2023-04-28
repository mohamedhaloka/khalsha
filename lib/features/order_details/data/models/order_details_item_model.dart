class OrderDetailsItemModel {
  final String? title, description;
  final OrderDetailsTypes type;
  final OrderDetailsAction action;
  final bool enableGesture;
  OrderDetailsItemModel({
    required this.title,
    this.description,
    this.enableGesture = false,
    this.type = OrderDetailsTypes.none,
    this.action = OrderDetailsAction.none,
  });
}

enum OrderDetailsTypes {
  none,
  file,
}

enum OrderDetailsAction {
  none,
  uploadFile,
}
