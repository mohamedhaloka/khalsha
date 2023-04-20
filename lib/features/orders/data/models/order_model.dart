// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../customs_clearance_service/view/get/models/container_data_model.dart';
import '../../../customs_clearance_service/view/get/models/parcel_data_model.dart';
import '../../../order_details/data/models/order_section_model.dart';

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
    required this.goods,
    required this.steps,
    required this.offer,
    required this.files,
    required this.items,
    required this.shippingmethods,
    required this.currency,
    required this.shippingport,
    required this.offers,
    required this.invoice,
    required this.certificates,
    required this.invoiceUrl,
    required this.storingPurpose,
    required this.storingType,
    required this.palletCounts,
    required this.spaceType,
    required this.warehouseSpace,
    required this.customWarehouseSpace,
    required this.contractType,
    required this.contractCount,
    required this.address,
    required this.addressLat,
    required this.addressLng,
    required this.contractStartAt,
    required this.item,
    required this.needPackaging,
    required this.exportCertificates,
    required this.importCertificates,
    required this.farmingProcedures,
    required this.certificate,
    required this.testReport,
    required this.testReportPhoto,
    required this.factoryAudit,
    required this.factoryAuditPhoto,
    required this.fromshipmentLocation,
    this.fromshipmentOtherLocation,
    required this.fromcountryId,
    required this.fromcity,
    required this.toshipmentLocation,
    this.toshipmentOtherLocation,
    required this.tocountryId,
    required this.tocity,
    required this.fromcityLat,
    required this.fromcityLng,
    required this.tocityLat,
    required this.tocityLng,
    required this.shipmentReady,
    required this.shipmentSizes,
    required this.insurance,
    required this.customsClearance,
    required this.fromCountry,
    required this.toCountry,
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
  String storingPurpose;
  String storingType;
  String spaceType;
  int palletCounts;
  String warehouseSpace;
  String customWarehouseSpace;
  String contractType;
  int contractCount;
  String address;
  String addressLat;
  String addressLng;
  DateTime contractStartAt;
  String needPackaging;
  DataModel item;
  DataModel fromCountry;
  DataModel toCountry;
  String exportCertificates;
  String importCertificates;
  String farmingProcedures;
  String certificate;
  String fromshipmentLocation;
  dynamic fromshipmentOtherLocation;
  int fromcountryId;
  String fromcity;
  String toshipmentLocation;
  dynamic toshipmentOtherLocation;
  int tocountryId;
  String tocity;
  String fromcityLat;
  String fromcityLng;
  String tocityLat;
  String tocityLng;
  String shipmentReady;
  String shipmentSizes;
  String insurance;
  String customsClearance;

  DateTime updatedAt;
  List<OrderStepModel> steps;
  List<OrderFile> files;
  List<LaboratoryItemModel> items;
  List<Shippingmethod> shippingmethods;
  DataModel currency;
  DataModel shippingport;
  List<GoodsModel> goods;
  List<OfferModel> offers;
  List<DataModel> certificates;
  Invoice? invoice;
  OfferModel? offer;
  String invoiceUrl;
  String testReport;
  String testReportPhoto;
  String factoryAudit;
  String factoryAuditPhoto;

  int get chargeFieldId {
    if (chargeField == 'personal') {
      return 0;
    } else {
      return 1;
    }
  }

  int get storingPurposeId {
    if (storingPurpose == 'personal') {
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

  int get spaceTypeId {
    if (shippingMethod == 'pallet') {
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

  List<OrderSectionModel> get customsClrearse => [
        OrderSectionModel(
          title: 'معلومات الطلب',
          data: [
            ItemModel(text: 'عنوان الطلب', description: title),
            ItemModel(text: 'وصف البضاعة', description: content),
            ItemModel(text: 'منفذ الشحنة', description: shippingport.name),
            ItemModel(text: 'نوع الشحنة', description: shipmentType),
            ItemModel(text: 'الإجمالي', description: total),
            ItemModel(text: 'نوع الشحن', description: shippingMethod),
            ItemModel(text: 'توصيل إلي', description: deliveryTo),
            ItemModel(text: 'مجال الشحنة', description: chargeField),
            ItemModel(text: 'هل يوجد بند جمزكي', description: customsItem),
            for (var item in items) ...[
              ItemModel(text: 'رقم البند الجمركي', description: item.name),
            ]
          ],
        ),
        OrderSectionModel(
          title: 'طرد',
          data: [
            for (var item in shippingmethods) ...[
              ItemModel(text: 'نوع البضاعة', description: item.parcelType),
              ItemModel(text: 'نوع الطرد', description: item.parcelType),
              ItemModel(
                  text: 'إجمالي الحجم (متر مكعب)', description: item.totalSize),
              ItemModel(
                  text: 'إجمالي الوزن (كيلوجرام)',
                  description: item.totalWeight),
              ItemModel(text: 'الكمية', description: item.quantity),
            ]
          ],
        ),
        OrderSectionModel(
          title: 'خدمات إضافية',
          data: [
            ItemModel(
                text: 'هل تريد التخزين',
                description: storageDaysNumber > 0 ? 'yes' : 'no'),
            ItemModel(text: 'عدد أيام التخزين', description: storageDays),
            for (var item in certificates) ...[
              ItemModel(
                text: 'شهادة',
                description: item.name,
              ),
            ]
          ],
        ),
      ];

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
        fromshipmentLocation: json["fromshipment_location"],
        fromshipmentOtherLocation: json["fromshipment_other_location"],
        fromcountryId: json["fromcountry_id"],
        fromcity: json["fromcity"],
        toshipmentLocation: json["toshipment_location"],
        toshipmentOtherLocation: json["toshipment_other_location"],
        tocountryId: json["tocountry_id"],
        tocity: json["tocity"],
        fromcityLat: json["fromcity_lat"],
        fromcityLng: json["fromcity_lng"],
        tocityLat: json["tocity_lat"],
        tocityLng: json["tocity_lng"],
        shipmentReady: json["shipment_ready"],
        shipmentSizes: json["shipment_sizes"],
        insurance: json["insurance"],
        customsClearance: json["customs_clearance"],
        item: DataModel.fromJson(json["item"] ?? {}),
        fromCountry: DataModel.fromJson(json["fromcountry"] ?? {}),
        toCountry: DataModel.fromJson(json["tocountry"] ?? {}),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        goods: List<GoodsModel>.from(
            (json["goods"] ?? []).map((x) => GoodsModel.fromJson(x))),
        steps: List<OrderStepModel>.from(
            (json["steps"] ?? []).map((x) => OrderStepModel.fromJson(x))),
        certificates: List<DataModel>.from(
            (json["get_certificates"] ?? []).map((x) => DataModel.fromJson(x))),
        files: List<OrderFile>.from(
            (json["files"] ?? []).map((x) => OrderFile.fromJson(x))),
        items: List<LaboratoryItemModel>.from(
            (json["items"] ?? []).map((x) => LaboratoryItemModel.fromJson(x))),
        shippingmethods: List<Shippingmethod>.from(
            (json["shippingmethods"] ?? [])
                .map((x) => Shippingmethod.fromJson(x))),
        currency: DataModel.fromJson(json["currency"] ?? {}),
        shippingport: DataModel.fromJson(json["shippingport"] ?? {}),
        offers: List<OfferModel>.from(
            (json["offers"] ?? []).map((x) => OfferModel.fromJson(x))),
        invoice: json["invoice"] == null
            ? null
            : Invoice.fromJson({}), //json["invoice"]
        offer:
            json["offer"] == null ? null : OfferModel.fromJson(json["offer"]),
        invoiceUrl: json["invoice_url"] ?? '',
        storingPurpose: json["storing_purpose"] ?? '',
        storingType: json["storing_type"] ?? '',
        spaceType: json["space_type"] ?? '',
        palletCounts: json["pallet_counts"] ?? 0,
        warehouseSpace: json["warehouse_space"] ?? '',
        customWarehouseSpace: json["custom_warehouse_space"] ?? '',
        contractType: json["contract_type"] ?? '',
        contractCount: json["contract_count"] ?? 0,
        address: json["address"] ?? '',
        addressLat: json["address_lat"] ?? '',
        addressLng: json["address_lng"] ?? '',
        contractStartAt: json["contract_start_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["contract_start_at"]),
        needPackaging: json["need_packaging"] ?? '',
        exportCertificates: json["export_certificates"] ?? '',
        importCertificates: json["import_certificates"] ?? '',
        farmingProcedures: json["farming_procedures"] ?? '',
        certificate: json["certificates"] ?? '',
        testReport: json["test_report"] ?? '',
        testReportPhoto: json["test_report_photo"] ?? '',
        factoryAudit: json["factory_audit"] ?? '',
        factoryAuditPhoto: json["factory_audit_photo"] ?? '',
      );

  factory OrderModel.empty() => OrderModel(
        id: 0,
        title: '',
        userId: 0,
        fromCountry: DataModel.empty(),
        toCountry: DataModel.empty(),
        user: User.fromJson({}),
        item: DataModel.empty(),
        shipmentType: '',
        chargeField: '',
        shippingPortId: 0,
        deliveryTo: '',
        testReport: '',
        testReportPhoto: '',
        factoryAudit: '',
        factoryAuditPhoto: '',
        customsItem: 'no',
        wantStorage: 'no',
        storageDays: '0',
        fromshipmentLocation: '',
        fromshipmentOtherLocation: '',
        fromcountryId: 0,
        fromcity: '',
        toshipmentLocation: '',
        toshipmentOtherLocation: '',
        tocountryId: 0,
        tocity: '',
        fromcityLat: '',
        fromcityLng: '',
        tocityLat: '',
        tocityLng: '',
        total: '',
        currencyId: 0,
        shipmentReady: '',
        content: '',
        shipmentSizes: '',
        insurance: '',
        customsClearance: '',
        shippingMethod: '',
        notes: '',
        status: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        goods: [],
        steps: [],
        files: [],
        items: [],
        shippingmethods: [],
        currency: DataModel.fromJson({}),
        shippingport: DataModel.fromJson({}),
        offers: [],
        certificates: [],
        invoice: Invoice.fromJson({}),
        offer: OfferModel.fromJson({}),
        invoiceUrl: '',
        storingPurpose: '',
        storingType: '',
        spaceType: '',
        palletCounts: 0,
        warehouseSpace: '',
        customWarehouseSpace: '',
        contractType: '',
        contractCount: 0,
        address: '',
        addressLat: '',
        addressLng: '',
        contractStartAt: DateTime.now(),
        needPackaging: '',
        exportCertificates: '',
        importCertificates: '',
        farmingProcedures: '',
        certificate: '',
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
        "goods": List<dynamic>.from(steps.map((x) => x)),
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "files": List<dynamic>.from(files.map((x) => x)),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "shippingmethods":
            List<dynamic>.from(shippingmethods.map((x) => x.toJson())),
        "currency": currency.toJson(),
        "shippingport": shippingport.toJson(),
        "offers": List<dynamic>.from(offers.map((x) => x)),
        "get_certificates": List<dynamic>.from(certificates.map((x) => x)),
        "invoice": invoice!.toJson(),
        "offer": offer!.toJson(),
        "invoice_url": invoiceUrl,
        "storing_purpose": storingPurpose,
        "storing_type": storingType,
        "space_type": spaceType,
        "pallet_counts": palletCounts,
        "warehouse_space": warehouseSpace,
        "custom_warehouse_space": customWarehouseSpace,
        "contract_type": contractType,
        "contract_count": contractCount,
        "address": address,
        "address_lat": addressLat,
        "address_lng": addressLng,
        "contract_start_at": contractStartAt.toIso8601String(),
        "need_packaging": needPackaging,
        "export_certificates": exportCertificates,
        "import_certificates": importCertificates,
        "farming_procedures": farmingProcedures,
        "certificate": certificates,
      };
}

class LaboratoryItemModel {
  LaboratoryItemModel({
    required this.id,
    required this.laboratoryId,
    required this.itemServiceId,
    required this.customsCode,
    required this.factoryName,
    required this.photoCard,
    required this.photoItem,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  int id;
  int laboratoryId;
  int itemServiceId;
  String customsCode;
  String factoryName;
  String photoCard;
  String photoItem;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String name;

  factory LaboratoryItemModel.fromJson(Map<String, dynamic> json) =>
      LaboratoryItemModel(
        id: json["id"] ?? 0,
        laboratoryId: json["laboratory_id"] ?? 0,
        itemServiceId: json["item_service_id"] ?? 0,
        customsCode: json["customs_code"] ?? '',
        factoryName: json["factory_name"] ?? '',
        photoCard: json["photo_card"] ?? '',
        photoItem: json["photo_item"] ?? '',
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "laboratory_id": laboratoryId,
        "item_service_id": itemServiceId,
        "customs_code": customsCode,
        "factory_name": factoryName,
        "photo_card": photoCard,
        "photo_item": photoItem,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
      };
}

class GoodsModel {
  GoodsModel({
    required this.id,
    required this.seaShippingId,
    required this.through,
    this.totalWeight,
    this.overallSize,
    required this.quantity,
    required this.unitType,
    required this.length,
    required this.width,
    required this.height,
    required this.cm,
    required this.weightPerUnit,
    this.image,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int seaShippingId;
  String through;
  dynamic totalWeight;
  dynamic overallSize;
  String quantity;
  String unitType;
  String length;
  String width;
  String height;
  String cm;
  String weightPerUnit;
  dynamic image;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory GoodsModel.fromJson(Map<String, dynamic> json) => GoodsModel(
        id: json["id"],
        seaShippingId: json["sea_shipping_id"],
        through: json["through"],
        totalWeight: json["total_weight"],
        overallSize: json["overall_size"],
        quantity: json["quantity"],
        unitType: json["unit_type"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        cm: json["cm"],
        weightPerUnit: json["weight_per_unit"],
        image: json["image"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sea_shipping_id": seaShippingId,
        "through": through,
        "total_weight": totalWeight,
        "overall_size": overallSize,
        "quantity": quantity,
        "unit_type": unitType,
        "length": length,
        "width": width,
        "height": height,
        "cm": cm,
        "weight_per_unit": weightPerUnit,
        "image": image,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Feedback {
  Feedback({
    required this.id,
    required this.userId,
    required this.ownerId,
    required this.rate,
    required this.feedback,
    required this.formType,
    required this.formId,
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
  String formType;
  int formId;
  String status;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
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
  List<OrderFile> files;

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
        files: List<OrderFile>.from(
            json["files"].map((x) => OrderFile.fromJson(x))),
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

class OfferModel {
  OfferModel({
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

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
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

class Invoice {
  Invoice({
    required this.id,
    required this.customClearanceId,
    required this.customClearancesOfferId,
    required this.userId,
    required this.ship,
    required this.ladingNumber,
    required this.typeGoods,
    required this.weight,
    required this.containerCount,
    required this.importListNumber,
    required this.importListDate,
    required this.totalWithoutTax,
    required this.totalTax,
    required this.total,
    required this.note,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  int customClearanceId;
  int customClearancesOfferId;
  int userId;
  String ship;
  String ladingNumber;
  String typeGoods;
  String weight;
  String containerCount;
  String importListNumber;
  DateTime? importListDate;
  String totalWithoutTax;
  String totalTax;
  String total;
  String note;
  String status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  User user;

  List<ItemModel> get items => [
        ItemModel(
          text: 'المستخدم',
          description: user.name,
        ),
        ItemModel(
          text: 'الباخرة',
          description: ship,
        ),
        ItemModel(
          text: 'رقم البوليصة',
          description: ladingNumber,
        ),
        ItemModel(
          text: 'نوع البضاعة',
          description: typeGoods,
        ),
        ItemModel(
          text: 'عدد الحاويات',
          description: containerCount,
        ),
        ItemModel(
          text: 'الوزن',
          description: weight,
        ),
        ItemModel(
          text: 'رقم بيان الإستيراد',
          description: importListNumber,
        ),
        ItemModel(
          text: 'تاريخ بيان الإستيراد',
          description: importListDate.toString(),
        ),
        ItemModel(
          text: 'الإجمالي بدون ضريبة القيمة المضافة',
          description: totalWithoutTax,
        ),
      ];

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json["id"] ?? 0,
        customClearanceId: json["custom_clearance_id"] ?? 0,
        customClearancesOfferId: json["custom_clearances_offer_id"] ?? 0,
        userId: json["user_id"] ?? 0,
        ship: json["ship"] ?? '',
        ladingNumber: json["lading_number"] ?? '',
        typeGoods: json["type_goods"] ?? '',
        weight: json["weight"] ?? '',
        containerCount: json["container_count"] ?? '',
        importListNumber: json["import_list_number"] ?? '',
        importListDate: json["import_list_date"] == null
            ? null
            : DateTime.parse(json["import_list_date"]),
        totalWithoutTax: json["total_without_tax"] ?? '',
        totalTax: json["total_tax"] ?? '',
        total: json["total"] ?? '',
        note: json["note"] ?? '',
        status: json["status"] ?? '',
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_clearance_id": customClearanceId,
        "custom_clearances_offer_id": customClearancesOfferId,
        "user_id": userId,
        "ship": ship,
        "lading_number": ladingNumber,
        "type_goods": typeGoods,
        "weight": weight,
        "container_count": containerCount,
        "import_list_number": importListNumber,
        "import_list_date":
            "${importListDate?.year.toString().padLeft(4, '0')}-${importListDate?.month.toString().padLeft(2, '0')}-${importListDate?.day.toString().padLeft(2, '0')}",
        "total_without_tax": totalWithoutTax,
        "total_tax": totalTax,
        "total": total,
        "note": note,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user.toJson(),
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
