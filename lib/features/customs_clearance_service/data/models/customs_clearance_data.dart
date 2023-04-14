class CustomsClearanceData {
  final int? orderId;

  final String title,
      shipmentType,
      chargeField,
      shippingPortId,
      deliveryTo,
      wantStorage,
      storageDays,
      customsItem,
      content,
      total,
      notes,
      currencyId,
      shippingMethod;

  final String? method;

  final List<String> customsItemIds,
      goodTypeId,
      containerType,
      containerSize,
      containerCount,
      parcelType,
      otherParcel,
      totalSize,
      totalWeight,
      quantity;

  const CustomsClearanceData({
    required this.orderId,
    required this.containerType,
    required this.containerCount,
    required this.containerSize,
    required this.parcelType,
    required this.quantity,
    required this.method,
    required this.notes,
    required this.totalWeight,
    required this.totalSize,
    required this.total,
    required this.title,
    required this.chargeField,
    required this.content,
    required this.currencyId,
    required this.customsItem,
    required this.customsItemIds,
    required this.deliveryTo,
    required this.goodTypeId,
    required this.otherParcel,
    required this.shipmentType,
    required this.shippingMethod,
    required this.shippingPortId,
    required this.storageDays,
    required this.wantStorage,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'shipment_type': shipmentType,
        'charge_field': chargeField,
        'shipping_port_id': shippingPortId,
        'delivery_to': deliveryTo,
        'want_storage': wantStorage,
        'storage_days': storageDays,
        'customs_item': customsItem,
        'content': content,
        'total': total,
        'currency_id': currencyId,
        'shipping_method': shippingMethod,
        'notes': notes,
        '_method': method,
      };
}
