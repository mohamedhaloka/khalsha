import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../customs_clearance_service/view/get/models/container_data_model.dart';
import '../../../customs_clearance_service/view/get/models/parcel_data_model.dart';
import '../../../order_details/data/models/order_details_item_model.dart';
import '../../../order_details/data/models/order_section_item_model.dart';

part 'customs_clearance_order.dart';
part 'ware_house_order.dart';

abstract class OrderModel {
  OrderModel({
    required this.id,
    required this.title,
    required this.userId,
    required this.user,
    required this.offersNum,
    required this.status,
    required this.offers,
    required this.offer,
    required this.invoice,
    required this.certificates,
    required this.invoiceUrl,
  });

  int id;
  String title;
  String status;
  int userId;
  User user;
  int offersNum;
  List<OfferModel> offers;
  List<DataModel> certificates;
  OfferModel? offer;
  Invoice? invoice;
  String? invoiceUrl;

  List<OrderSectionItemModel> get data => <OrderSectionItemModel>[];
}

class Feedback {
  Feedback({
    this.id,
    this.userId,
    this.ownerId,
    this.rate,
    this.feedback,
    this.formType,
    this.formId,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int? id;
  int? userId;
  int? ownerId;
  int? rate;
  String? feedback;
  String? formType;
  int? formId;
  String? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json["id"],
        userId: json["user_id"],
        ownerId: json["owner_id"],
        rate: json["rate"],
        feedback: json["feedback"],
        formType: json["form_type"],
        formId: json["form_id"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "owner_id": ownerId,
        "rate": rate,
        "feedback": feedback,
        "form_type": formType,
        "form_id": formId,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

abstract class OfferModel {
  OfferModel({
    this.id,
    this.userId,
    this.status,
    this.notes,
    this.acceptedAt,
    this.rejectedAt,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.total,
  });

  int? id;
  int? userId;
  String? total;
  String? status;
  String? notes;
  DateTime? acceptedAt;
  dynamic rejectedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
}

class User {
  User({
    this.id,
    this.name,
    this.photoProfile,
    this.bio,
  });

  int? id;
  String? name;
  String? photoProfile;
  String? bio;

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

abstract class Invoice {
  Invoice({
    this.user,
    this.total,
    this.id,
    this.updatedAt,
    this.createdAt,
    this.status,
    this.note,
    this.deletedAt,
    this.userId,
  });

  int? id;
  int? userId;
  String? total;
  String? note;
  String? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  List<ItemModel> get items => <ItemModel>[];
}

class OrderFile {
  OrderFile({
    this.id,
    this.userId,
    this.file,
    this.fullPath,
    this.fileType,
    this.fileId,
    this.path,
    this.ext,
    this.name,
    this.size,
    this.sizeBytes,
    this.mimtype,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? file;
  String? fullPath;
  String? fileType;
  int? fileId;
  String? path;
  String? ext;
  String? name;
  String? size;
  int? sizeBytes;
  String? mimtype;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OrderFile.fromJson(Map<String, dynamic> json) => OrderFile(
        id: json["id"],
        userId: json["user_id"],
        file: json["file"],
        fullPath: json["full_path"],
        fileType: json["file_type"],
        fileId: json["file_id"],
        path: json["path"],
        ext: json["ext"],
        name: json["name"],
        size: json["size"],
        sizeBytes: json["size_bytes"],
        mimtype: json["mimtype"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "file": file,
        "full_path": fullPath,
        "file_type": fileType,
        "file_id": fileId,
        "path": path,
        "ext": ext,
        "name": name,
        "size": size,
        "size_bytes": sizeBytes,
        "mimtype": mimtype,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
