class WareHouseData {
  final int id;
  final String title,
      itemId,
      storingPurpose,
      storingType,
      spaceType,
      contractType,
      contractCount,
      address,
      addressLat,
      addressLng,
      contractStartAt,
      notes,
      needPackaging,
      exportCertificates,
      importCertificates,
      farmingProcedures,
      certificates;

  final String? customWarehouseSpace, warehouseSpace, palletCounts;

  final List<String> certificate;

  const WareHouseData({
    required this.id,
    required this.needPackaging,
    required this.importCertificates,
    required this.exportCertificates,
    required this.farmingProcedures,
    required this.certificates,
    required this.notes,
    required this.certificate,
    required this.title,
    required this.address,
    required this.addressLat,
    required this.addressLng,
    required this.contractCount,
    required this.contractStartAt,
    required this.contractType,
    required this.customWarehouseSpace,
    required this.itemId,
    required this.palletCounts,
    required this.spaceType,
    required this.storingPurpose,
    required this.storingType,
    required this.warehouseSpace,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'certificates': certificates,
        'notes': notes,
        'item_id': itemId,
        'storing_purpose': storingPurpose,
        'storing_type': storingType,
        'pallet_counts': palletCounts,
        'space_type': spaceType,
        'warehouse_space': warehouseSpace,
        'custom_warehouse_space': customWarehouseSpace,
        'contract_type': contractType,
        'contract_count': contractCount,
        'address': address,
        'address_lat': addressLat,
        'address_lng': addressLng,
        'contract_start_at': contractStartAt,
        'need_packaging': needPackaging,
        'export_certificates': exportCertificates,
        'import_certificates': importCertificates,
        'farming_procedures': farmingProcedures,
      };
}
