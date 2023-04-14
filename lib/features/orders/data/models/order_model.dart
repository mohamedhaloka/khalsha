// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';

import '../../../customs_clearance_service/view/get/models/container_data_model.dart';
import '../../../customs_clearance_service/view/get/models/parcel_data_model.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.id,
    required this.title,
    required this.userId,
    required this.user,
    required this.shipmentType,
    required this.chargeField,
    required this.shippingPortId,
    required this.deliveryTo,
    required this.customsItem,
    required this.wantStorage,
    required this.storageDays,
    required this.content,
    required this.shippingMethod,
    required this.total,
    required this.currencyId,
    required this.notes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.steps,
    required this.files,
    required this.items,
    required this.shippingmethods,
    required this.currency,
    required this.shippingport,
    required this.offers,
    required this.invoice,
    required this.invoiceUrl,
  });

  int id;
  String title;
  int userId;
  User user;
  String shipmentType;
  String chargeField;
  int shippingPortId;
  String deliveryTo;
  String customsItem;
  String wantStorage;
  String storageDays;
  String content;
  String shippingMethod;
  String total;
  int currencyId;
  String notes;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<OrderStepModel> steps;
  List<OrderFile> files;
  List<Item> items;
  List<Shippingmethod> shippingmethods;
  DataModel currency;
  DataModel shippingport;
  List<OrderFilterModel> offers;
  Map<String, Invoice?> invoice;
  String invoiceUrl;

  int get chargeFieldId {
    if (chargeField == 'personal') {
      return 0;
    } else {
      return 1;
    }
  }

  int get shipmentTypeId {
    if (shipmentType == 'import') {
      return 0;
    } else {
      return 1;
    }
  }

  int get shippingMethodId {
    if (shippingMethod == 'parcel') {
      return 0;
    } else {
      return 1;
    }
  }

  int get storageDaysNumber {
    return int.tryParse(storageDays) ?? 0;
  }

  List<ParcelDataModel> get parcelDataList {
    List<ParcelDataModel> parcelData = <ParcelDataModel>[];
    for (var parcelItem in shippingmethods) {
      parcelData.add(
        ParcelDataModel(
          quantity: TextEditingController(text: parcelItem.quantity),
          goodsType: parcelItem.goodTypeId.toString().obs,
          totalSize: TextEditingController(text: parcelItem.totalSize),
          totalWeight: TextEditingController(text: parcelItem.totalWeight),
          parcelType: parcelItem.parcelType.obs,
          otherParcelName: TextEditingController(text: parcelItem.otherParcel),
        ),
      );
    }
    return parcelData;
  }

  List<ContainerDataModel> get containerDataList {
    List<ContainerDataModel> containerData = <ContainerDataModel>[];
    for (var containerItem in shippingmethods) {
      containerData.add(
        ContainerDataModel(
          containerSize: containerItem.containerSize.obs,
          goodsType: containerItem.containerSize.obs,
          containerCount: TextEditingController(
            text: (int.tryParse(containerItem.containerCount) ?? 0).toString(),
          ),
          containerType: containerItem.containerType.obs,
        ),
      );
    }
    return containerData;
  }

  List<TextEditingController> get customsClauseDataList {
    List<TextEditingController> customsClause = <TextEditingController>[];
    for (var customsClauseItem in items) {
      customsClause.add(TextEditingController(text: customsClauseItem.name));
    }
    return customsClause;
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        userId: json["user_id"] ?? 0,
        user: User.fromJson(json["user"] ?? {}),
        shipmentType: json["shipment_type"] ?? '',
        chargeField: json["charge_field"] ?? '',
        shippingPortId: json["shipping_port_id"] ?? 0,
        deliveryTo: json["delivery_to"] ?? '',
        customsItem: json["customs_item"] ?? 'no',
        wantStorage: json["want_storage"] ?? 'no',
        storageDays: json["storage_days"] ?? '0',
        content: json["content"] ?? '',
        shippingMethod: json["shipping_method"] ?? '',
        total: json["total"] ?? '',
        currencyId: json["currency_id"] ?? 0,
        notes: json["notes"] ?? '',
        status: json["status"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        steps: List<OrderStepModel>.from(
            (json["steps"] ?? []).map((x) => OrderStepModel.fromJson(x))),
        files: List<OrderFile>.from(
            (json["files"] ?? []).map((x) => OrderFile.fromJson(x))),
        items:
            List<Item>.from((json["items"] ?? []).map((x) => Item.fromJson(x))),
        shippingmethods: List<Shippingmethod>.from(
            (json["shippingmethods"] ?? [])
                .map((x) => Shippingmethod.fromJson(x))),
        currency: DataModel.fromJson(json["currency"] ?? {}),
        shippingport: DataModel.fromJson(json["shippingport"] ?? {}),
        offers: List<OrderFilterModel>.from(
            (json["offers"] ?? []).map((x) => OrderFilterModel.fromJson(x))),
        invoice: Map.from(json["invoice"] ?? {}).map((k, v) =>
            MapEntry<String, Invoice?>(
                k, v == null ? null : Invoice.fromJson(v))),
        invoiceUrl: json["invoice_url"] ?? '',
      );
  factory OrderModel.empty() => OrderModel(
        id: 0,
        title: '',
        userId: 0,
        user: User.fromJson({}),
        shipmentType: '',
        chargeField: '',
        shippingPortId: 0,
        deliveryTo: '',
        customsItem: 'no',
        wantStorage: 'no',
        storageDays: '0',
        content: '',
        shippingMethod: '',
        total: '',
        currencyId: 0,
        notes: '',
        status: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        steps: [],
        files: [],
        items: [],
        shippingmethods: [],
        currency: DataModel.fromJson({}),
        shippingport: DataModel.fromJson({}),
        offers: [],
        invoice: {},
        invoiceUrl: '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "user_id": userId,
        "user": user.toJson(),
        "shipment_type": shipmentType,
        "charge_field": chargeField,
        "shipping_port_id": shippingPortId,
        "delivery_to": deliveryTo,
        "customs_item": customsItem,
        "want_storage": wantStorage,
        "storage_days": storageDays,
        "content": content,
        "shipping_method": shippingMethod,
        "total": total,
        "currency_id": currencyId,
        "notes": notes,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "files": List<dynamic>.from(files.map((x) => x)),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "shippingmethods":
            List<dynamic>.from(shippingmethods.map((x) => x.toJson())),
        "currency": currency.toJson(),
        "shippingport": shippingport.toJson(),
        "offers": List<dynamic>.from(offers.map((x) => x)),
        "invoice": Map.from(invoice)
            .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
        "invoice_url": invoiceUrl,
      };
}

class OrderStepModel {
  OrderStepModel({
    required this.id,
    required this.customClearanceId,
    required this.customClearancesOfferId,
    required this.userId,
    required this.step,
    this.note,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.files,
  });

  int id;
  int customClearanceId;
  int customClearancesOfferId;
  int userId;
  String step;
  dynamic note;
  String status;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  List<dynamic> files;

  factory OrderStepModel.fromJson(Map<String, dynamic> json) => OrderStepModel(
        id: json["id"] ?? 0,
        customClearanceId: json["custom_clearance_id"] ?? 0,
        customClearancesOfferId: json["custom_clearances_offer_id"] ?? 0,
        userId: json["user_id"] ?? 0,
        step: json["step"] ?? 0,
        note: json["note"] ?? '',
        status: json["status"] ?? '',
        deletedAt: json["deleted_at"],
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        user: User.fromJson(json["user"] ?? {}),
        files: List<dynamic>.from(json["files"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_clearance_id": customClearanceId,
        "custom_clearances_offer_id": customClearancesOfferId,
        "user_id": userId,
        "step": step,
        "note": note,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "files": List<dynamic>.from(files.map((x) => x)),
      };
}

class OrderFilterModel {
  OrderFilterModel({
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
    required this.acceptedAt,
    this.rejectedAt,
    required this.systemPercent,
    required this.systemTax,
    required this.settlementId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
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
  DateTime acceptedAt;
  dynamic rejectedAt;
  String systemPercent;
  String systemTax;
  int settlementId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory OrderFilterModel.fromJson(Map<String, dynamic> json) =>
      OrderFilterModel(
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
        acceptedAt:
            DateTime.parse(json["accepted_at"] ?? DateTime.now().toString()),
        rejectedAt: json["rejected_at"],
        systemPercent: json["system_percent"] ?? '',
        systemTax: json["system_tax"] ?? '',
        settlementId: json["settlement_id"] ?? 0,
        deletedAt: json["deleted_at"],
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        user: User.fromJson(json["user"] ?? {}),
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
        "accepted_at": acceptedAt.toIso8601String(),
        "rejected_at": rejectedAt,
        "system_percent": systemPercent,
        "system_tax": systemTax,
        "settlement_id": settlementId,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class Feedback {
  Feedback({
    required this.id,
    required this.userId,
    required this.ownerId,
    required this.rate,
    required this.feedback,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  int userId;
  int ownerId;
  int rate;
  String feedback;
  String status;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
        ownerId: json["owner_id"] ?? 0,
        rate: json["rate"] ?? 0,
        feedback: json["feedback"] ?? '',
        status: json["status"] ?? '',
        deletedAt: json["deleted_at"],
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        user: User.fromJson(json["user"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "owner_id": ownerId,
        "rate": rate,
        "feedback": feedback,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class Invoice {
  Invoice({
    this.id,
    this.name,
    this.photoProfile,
    this.bio,
    this.ratingsStatistics,
    this.ratingsOverall,
  });

  dynamic id;
  dynamic name;
  dynamic photoProfile;
  dynamic bio;
  dynamic ratingsStatistics;
  dynamic ratingsOverall;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        photoProfile: json["photo_profile"] ?? '',
        bio: json["bio"] ?? '',
        ratingsStatistics: json["ratings_statistics"] ?? '',
        ratingsOverall: json["ratings_overall"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo_profile": photoProfile,
        "bio": bio,
        "ratings_statistics": ratingsStatistics,
        "ratings_overall": ratingsOverall,
      };
}

class Item {
  Item({
    required this.id,
    required this.customClearanceId,
    required this.name,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int customClearanceId;
  String name;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] ?? 0,
        customClearanceId: json["custom_clearance_id"] ?? 0,
        name: json["name"] ?? '',
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_clearance_id": customClearanceId,
        "name": name,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Shippingmethod {
  Shippingmethod({
    required this.id,
    required this.customClearanceId,
    required this.goodTypeId,
    required this.shippingMethod,
    required this.parcelType,
    this.otherParcel,
    required this.totalSize,
    required this.totalWeight,
    required this.quantity,
    required this.containerType,
    required this.containerSize,
    required this.containerCount,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int customClearanceId;
  int goodTypeId;
  String shippingMethod;
  String parcelType;
  String? otherParcel;
  String totalSize;
  String totalWeight;
  String quantity;
  String containerType;
  String containerSize;
  String containerCount;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Shippingmethod.fromJson(Map<String, dynamic> json) => Shippingmethod(
        id: json["id"] ?? 0,
        customClearanceId: json["custom_clearance_id"] ?? 0,
        goodTypeId: json["good_type_id"] ?? 0,
        shippingMethod: json["shipping_method"] ?? '',
        parcelType: json["parcel_type"] ?? '',
        otherParcel: json["other_parcel"] ?? '',
        totalSize: json["total_size"] ?? '',
        totalWeight: json["total_weight"] ?? '',
        quantity: json["quantity"] ?? '',
        containerType: json["container_type"] ?? '',
        containerSize: json["container_size"] ?? '',
        containerCount: json["container_count"] ?? '',
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_clearance_id": customClearanceId,
        "good_type_id": goodTypeId,
        "shipping_method": shippingMethod,
        "parcel_type": parcelType,
        "other_parcel": otherParcel,
        "total_size": totalSize,
        "total_weight": totalWeight,
        "quantity": quantity,
        "container_type": containerType,
        "container_size": containerSize,
        "container_count": containerCount,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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

class OrderFile {
  OrderFile({
    required this.id,
    required this.userId,
    required this.file,
    required this.fullPath,
    required this.fileType,
    required this.fileId,
    required this.path,
    required this.ext,
    required this.name,
    required this.size,
    required this.sizeBytes,
    required this.mimtype,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  String file;
  String fullPath;
  String fileType;
  int fileId;
  String path;
  String ext;
  String name;
  String size;
  int sizeBytes;
  String mimtype;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
