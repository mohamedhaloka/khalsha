// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.id,
    required this.customClearanceId,
    required this.userId,
    required this.firstContainer,
    required this.extraContainer,
    required this.singleCharge,
    required this.transport,
    required this.translate,
    required this.unloading,
    required this.deliveryPermits,
    required this.total,
    required this.shippingMethod,
    required this.status,
    required this.notes,
    this.acceptedAt,
    this.rejectedAt,
    required this.systemPercent,
    required this.systemTax,
    this.settlementId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.customclearance,
  });

  int id;
  int customClearanceId;
  int userId;
  String firstContainer;
  String extraContainer;
  String singleCharge;
  String transport;
  String translate;
  String unloading;
  String deliveryPermits;
  String total;
  String shippingMethod;
  String status;
  String notes;
  dynamic acceptedAt;
  dynamic rejectedAt;
  String systemPercent;
  String systemTax;
  dynamic settlementId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  Customclearance customclearance;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"] ?? 0,
        customClearanceId: json["custom_clearance_id"] ?? 0,
        userId: json["user_id"] ?? 0,
        firstContainer: json["first_container"] ?? '',
        extraContainer: json["extra_container"] ?? '',
        singleCharge: json["single_charge"] ?? '',
        transport: json["transport"] ?? '',
        translate: json["translate"] ?? '',
        unloading: json["unloading"] ?? '',
        deliveryPermits: json["delivery_permits"] ?? '',
        total: json["total"] ?? '',
        shippingMethod: json["shipping_method"] ?? '',
        status: json["status"] ?? '',
        notes: json["notes"] ?? '',
        acceptedAt: json["accepted_at"],
        rejectedAt: json["rejected_at"],
        systemPercent: json["system_percent"] ?? '',
        systemTax: json["system_tax"] ?? '',
        settlementId: json["settlement_id"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customclearance:
            Customclearance.fromJson(json["customclearance"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_clearance_id": customClearanceId,
        "user_id": userId,
        "first_container": firstContainer,
        "extra_container": extraContainer,
        "single_charge": singleCharge,
        "transport": transport,
        "translate": translate,
        "unloading": unloading,
        "delivery_permits": deliveryPermits,
        "total": total,
        "shipping_method": shippingMethod,
        "status": status,
        "notes": notes,
        "accepted_at": acceptedAt,
        "rejected_at": rejectedAt,
        "system_percent": systemPercent,
        "system_tax": systemTax,
        "settlement_id": settlementId,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "customclearance": customclearance.toJson(),
      };
}

class Customclearance {
  Customclearance({
    required this.id,
    required this.title,
    required this.status,
    required this.userId,
    required this.user,
  });

  int id;
  String title;
  String status;
  int userId;
  User user;

  factory Customclearance.fromJson(Map<String, dynamic> json) =>
      Customclearance(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        status: json["status"] ?? '',
        userId: json["user_id"] ?? 0,
        user: User.fromJson(json["user"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "user_id": userId,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.photoProfile,
    required this.bio,
  });

  int id;
  String name;
  String photoProfile;
  String bio;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        photoProfile: json["photo_profile"] ?? '',
        bio: json["bio"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo_profile": photoProfile,
        "bio": bio,
      };
}
