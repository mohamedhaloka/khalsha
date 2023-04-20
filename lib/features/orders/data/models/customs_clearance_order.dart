// // part of 'order_model.dart';
//
// class CustomsClearanceOrder {
//   int id;
//   String title;
//   int userId;
//   User user;
//   String shipmentType;
//   String chargeField;
//   int shippingPortId;
//   String deliveryTo;
//   String customsItem;
//   String wantStorage;
//   String storageDays;
//   String content;
//   String shippingMethod;
//   String total;
//   int currencyId;
//   String notes;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<OrderStepModel> steps;
//   List<OrderFile> files;
//   List<Item> items;
//   List<Shippingmethod> shippingmethods;
//   DataModel currency;
//   DataModel shippingport;
//   List<OfferModel> offers;
//   List<DataModel> certificates;
//   Invoice? invoice;
//   OfferModel? offer;
//   String invoiceUrl;
//
//   CustomsClearanceOrder({
//     required this.id,
//     required this.title,
//     required this.userId,
//     required this.user,
//     required this.shipmentType,
//     required this.chargeField,
//     required this.shippingPortId,
//     required this.deliveryTo,
//     required this.customsItem,
//     required this.wantStorage,
//     required this.storageDays,
//     required this.content,
//     required this.shippingMethod,
//     required this.total,
//     required this.currencyId,
//     required this.notes,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.steps,
//     required this.offer,
//     required this.files,
//     required this.items,
//     required this.shippingmethods,
//     required this.currency,
//     required this.shippingport,
//     required this.offers,
//     required this.invoice,
//     required this.certificates,
//     required this.invoiceUrl,
//   });
//
//   int get chargeFieldId {
//     if (chargeField == 'personal') {
//       return 0;
//     } else {
//       return 1;
//     }
//   }
//
//   int get shipmentTypeId {
//     if (shipmentType == 'import') {
//       return 0;
//     } else {
//       return 1;
//     }
//   }
//
//   int get shippingMethodId {
//     if (shippingMethod == 'parcel') {
//       return 0;
//     } else {
//       return 1;
//     }
//   }
//
//   int get spaceTypeId {
//     if (shippingMethod == 'pallet') {
//       return 0;
//     } else {
//       return 1;
//     }
//   }
//
//   int get storageDaysNumber {
//     return int.tryParse(storageDays) ?? 0;
//   }
//
//   List<ParcelDataModel> get parcelDataList {
//     List<ParcelDataModel> parcelData = <ParcelDataModel>[];
//     for (var parcelItem in shippingmethods) {
//       parcelData.add(
//         ParcelDataModel(
//           quantity: TextEditingController(text: parcelItem.quantity),
//           goodsType: parcelItem.goodTypeId.toString().obs,
//           totalSize: TextEditingController(text: parcelItem.totalSize),
//           totalWeight: TextEditingController(text: parcelItem.totalWeight),
//           parcelType: parcelItem.parcelType.obs,
//           otherParcelName: TextEditingController(text: parcelItem.otherParcel),
//         ),
//       );
//     }
//     return parcelData;
//   }
//
//   List<ContainerDataModel> get containerDataList {
//     List<ContainerDataModel> containerData = <ContainerDataModel>[];
//     for (var containerItem in shippingmethods) {
//       containerData.add(
//         ContainerDataModel(
//           containerSize: containerItem.containerSize.obs,
//           goodsType: containerItem.containerSize.obs,
//           containerCount: TextEditingController(
//             text: (int.tryParse(containerItem.containerCount) ?? 0).toString(),
//           ),
//           containerType: containerItem.containerType.obs,
//         ),
//       );
//     }
//     return containerData;
//   }
//
//   List<TextEditingController> get customsClauseDataList {
//     List<TextEditingController> customsClause = <TextEditingController>[];
//     for (var customsClauseItem in items) {
//       customsClause.add(TextEditingController(text: customsClauseItem.name));
//     }
//     return customsClause;
//   }
//
//   factory CustomsClearanceOrder.fromJson(Map<String, dynamic> json) =>
//       CustomsClearanceOrder(
//         id: json["id"] ?? 0,
//         title: json["title"] ?? '',
//         userId: json["user_id"] ?? 0,
//         user: User.fromJson(json["user"] ?? {}),
//         shipmentType: json["shipment_type"] ?? '',
//         chargeField: json["charge_field"] ?? '',
//         shippingPortId: json["shipping_port_id"] ?? 0,
//         deliveryTo: json["delivery_to"] ?? '',
//         customsItem: json["customs_item"] ?? 'no',
//         wantStorage: json["want_storage"] ?? 'no',
//         storageDays: json["storage_days"] ?? '0',
//         content: json["content"] ?? '',
//         shippingMethod: json["shipping_method"] ?? '',
//         total: json["total"] ?? '',
//         currencyId: json["currency_id"] ?? 0,
//         notes: json["notes"] ?? '',
//         status: json["status"] ?? '',
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         steps: List<OrderStepModel>.from(
//             (json["steps"] ?? []).map((x) => OrderStepModel.fromJson(x))),
//         certificates: List<DataModel>.from(
//             (json["get_certificates"] ?? []).map((x) => DataModel.fromJson(x))),
//         files: List<OrderFile>.from(
//             (json["files"] ?? []).map((x) => OrderFile.fromJson(x))),
//         items:
//             List<Item>.from((json["items"] ?? []).map((x) => Item.fromJson(x))),
//         shippingmethods: List<Shippingmethod>.from(
//             (json["shippingmethods"] ?? [])
//                 .map((x) => Shippingmethod.fromJson(x))),
//         currency: DataModel.fromJson(json["currency"] ?? {}),
//         shippingport: DataModel.fromJson(json["shippingport"] ?? {}),
//         offers: List<OfferModel>.from(
//             (json["offers"] ?? []).map((x) => OfferModel.fromJson(x))),
//         invoice:
//             json["invoice"] == null ? null : Invoice.fromJson(json["invoice"]),
//         offer:
//             json["offer"] == null ? null : OfferModel.fromJson(json["offer"]),
//         invoiceUrl: json["invoice_url"] ?? '',
//       );
//
//   factory CustomsClearanceOrder.empty() => CustomsClearanceOrder(
//         id: 0,
//         title: '',
//         userId: 0,
//         user: User.fromJson({}),
//         shipmentType: '',
//         chargeField: '',
//         shippingPortId: 0,
//         deliveryTo: '',
//         customsItem: 'no',
//         wantStorage: 'no',
//         storageDays: '0',
//         content: '',
//         shippingMethod: '',
//         total: '',
//         currencyId: 0,
//         notes: '',
//         status: '',
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         steps: [],
//         files: [],
//         items: [],
//         shippingmethods: [],
//         currency: DataModel.fromJson({}),
//         shippingport: DataModel.fromJson({}),
//         offers: [],
//         certificates: [],
//         invoice: Invoice.fromJson({}),
//         offer: OfferModel.fromJson({}),
//         invoiceUrl: '',
//       );
//
//   List<OrderSectionModel> get customsClrearse => [
//     OrderSectionModel(
//       title: 'معلومات الطلب',
//       data: [
//         ItemModel(text: 'عنوان الطلب', description: title),
//         ItemModel(text: 'وصف البضاعة', description: content),
//         ItemModel(text: 'منفذ الشحنة', description: shippingport.name),
//         ItemModel(text: 'نوع الشحنة', description: shipmentType),
//         ItemModel(text: 'الإجمالي', description: total),
//         ItemModel(text: 'نوع الشحن', description: shippingMethod),
//         ItemModel(text: 'توصيل إلي', description: deliveryTo),
//         ItemModel(text: 'مجال الشحنة', description: chargeField),
//         ItemModel(text: 'هل يوجد بند جمزكي', description: customsItem),
//         for (var item in items) ...[
//           ItemModel(text: 'رقم البند الجمركي', description: item.name),
//         ]
//       ],
//     ),
//     OrderSectionModel(
//       title: 'طرد',
//       data: [
//         for (var item in shippingmethods) ...[
//           ItemModel(text: 'نوع البضاعة', description: item.parcelType),
//           ItemModel(text: 'نوع الطرد', description: item.parcelType),
//           ItemModel(
//               text: 'إجمالي الحجم (متر مكعب)', description: item.totalSize),
//           ItemModel(
//               text: 'إجمالي الوزن (كيلوجرام)',
//               description: item.totalWeight),
//           ItemModel(text: 'الكمية', description: item.quantity),
//         ]
//       ],
//     ),
//     OrderSectionModel(
//       title: 'خدمات إضافية',
//       data: [
//         ItemModel(
//             text: 'هل تريد التخزين',
//             description: storageDaysNumber > 0 ? 'yes' : 'no'),
//         ItemModel(text: 'عدد أيام التخزين', description: storageDays),
//         for (var item in certificates) ...[
//           ItemModel(
//             text: 'شهادة',
//             description: item.name,
//           ),
//         ]
//       ],
//     ),
//   ];
//
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "user_id": userId,
//         "user": user.toJson(),
//         "shipment_type": shipmentType,
//         "charge_field": chargeField,
//         "shipping_port_id": shippingPortId,
//         "delivery_to": deliveryTo,
//         "customs_item": customsItem,
//         "want_storage": wantStorage,
//         "storage_days": storageDays,
//         "content": content,
//         "shipping_method": shippingMethod,
//         "total": total,
//         "currency_id": currencyId,
//         "notes": notes,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "steps": List<dynamic>.from(steps.map((x) => x)),
//         "files": List<dynamic>.from(files.map((x) => x)),
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//         "shippingmethods":
//             List<dynamic>.from(shippingmethods.map((x) => x.toJson())),
//         "currency": currency.toJson(),
//         "shippingport": shippingport.toJson(),
//         "offers": List<dynamic>.from(offers.map((x) => x)),
//         "get_certificates": List<dynamic>.from(certificates.map((x) => x)),
//         "invoice": invoice!.toJson(),
//         "offer": offer!.toJson(),
//         "invoice_url": invoiceUrl,
//         "certificate": certificates,
//       };
// }
