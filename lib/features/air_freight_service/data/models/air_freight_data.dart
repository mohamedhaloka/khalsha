class AirFreightData {
  final int id;
  final String title,
      shipmentType,
      fromShipmentLocation,
      fromShipmentOtherLocation,
      fromCountryId,
      fromCity,
      fromCityLat,
      fromCityLng,
      toShipmentLocation,
      toShipmentOtherLocation,
      toCountryId,
      toCity,
      toCityLat,
      toCityLng,
      total,
      currencyId,
      shipmentReady,
      content,
      insurance,
      customsClearance,
      certificates;

  final String? through;

  final List<String> certificate,
      name,
      length,
      height,
      width,
      weightPerUnit,
      cm,
      quantity,
      image;

  const AirFreightData({
    required this.id,
    required this.title,
    required this.shipmentType,
    required this.fromShipmentLocation,
    required this.fromShipmentOtherLocation,
    required this.fromCountryId,
    required this.fromCity,
    required this.fromCityLat,
    required this.fromCityLng,
    required this.toShipmentLocation,
    required this.toShipmentOtherLocation,
    required this.toCountryId,
    required this.toCity,
    required this.toCityLat,
    required this.toCityLng,
    required this.total,
    required this.currencyId,
    required this.shipmentReady,
    required this.content,
    required this.insurance,
    required this.customsClearance,
    required this.certificates,
    required this.through,
    required this.certificate,
    required this.length,
    required this.height,
    required this.width,
    required this.weightPerUnit,
    required this.cm,
    required this.quantity,
    required this.image,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'shipment_type': shipmentType,
        'fromshipment_location': fromShipmentLocation,
        'fromshipment_other_location': fromShipmentOtherLocation,
        'fromcountry_id': fromCountryId,
        'fromcity': fromCity,
        'fromcity_lat': fromCityLat,
        'fromcity_lng': fromCityLng,
        'toshipment_location': toShipmentLocation,
        'toshipment_other_location': toShipmentOtherLocation,
        'tocountry_id': toCountryId,
        'tocity': toCity,
        'tocity_lat': toCityLat,
        'tocity_lng': toCityLng,
        'total': total,
        'currency_id': currencyId,
        'shipment_ready': shipmentReady,
        'content': content,
        'insurance': insurance,
        'customs_clearance': customsClearance,
        'certificates': certificates,
        'through': through,
      };
}
