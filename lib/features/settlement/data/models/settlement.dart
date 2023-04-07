class SettlementModel {
  SettlementModel({
    required this.id,
    required this.userId,
    this.note,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.getTotal,
  });

  int id;
  int userId;
  dynamic note;
  String status;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  GetTotal getTotal;

  factory SettlementModel.fromJson(Map<String, dynamic> json) =>
      SettlementModel(
        id: json["id"],
        userId: json["user_id"],
        note: json["note"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        getTotal: GetTotal.fromJson(json["getTotal"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "note": note,
        "status": status,
        "deleted_at": deletedAt,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "getTotal": getTotal.toJson(),
      };
}

class GetTotal {
  GetTotal({
    required this.airShippingOffer,
    required this.customClearancesOffer,
    required this.laboratoryOffer,
    required this.landShippingOffer,
    required this.seaShippingOffer,
    required this.warehouseOffer,
    required this.total,
  });

  String airShippingOffer;
  String customClearancesOffer;
  String laboratoryOffer;
  String landShippingOffer;
  String seaShippingOffer;
  String warehouseOffer;
  double total;

  factory GetTotal.fromJson(Map<String, dynamic> json) => GetTotal(
        airShippingOffer: json["AirShippingOffer"],
        customClearancesOffer: json["CustomClearancesOffer"],
        laboratoryOffer: json["LaboratoryOffer"],
        landShippingOffer: json["LandShippingOffer"],
        seaShippingOffer: json["SeaShippingOffer"],
        warehouseOffer: json["WarehouseOffer"],
        total: json["total"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "AirShippingOffer": airShippingOffer,
        "CustomClearancesOffer": customClearancesOffer,
        "LaboratoryOffer": laboratoryOffer,
        "LandShippingOffer": landShippingOffer,
        "SeaShippingOffer": seaShippingOffer,
        "WarehouseOffer": warehouseOffer,
        "total": total,
      };
}
