part of 'order_model.dart';

class CustomsClearanceOrder extends OrderModel {
  String shipmentType;
  String chargeField;
  int shippingPortId;
  String deliveryTo;
  String deliveryToLat;
  String deliveryToLng;
  String customsItem;
  String wantStorage;
  String storageDays;
  String content;
  String shippingMethod;
  String total;
  int currencyId;
  String notes;
  DateTime createdAt;
  DateTime updatedAt;
  List<OrderStepModel> steps;
  List<OrderFile> files;
  List<DataModel> items;
  List<ShippingMethod> shippingMethods;
  DataModel currency;
  DataModel shippingPort;

  CustomsClearanceOrder({
    required super.id,
    required super.title,
    required super.userId,
    required super.user,
    required super.offersNum,
    required super.status,
    required super.offers,
    required super.offer,
    required super.invoiceUrl,
    required super.invoice,
    required super.certificates,
    required super.certificate,
    required super.feedback,
    required this.shipmentType,
    required this.chargeField,
    required this.shippingPortId,
    required this.deliveryTo,
    required this.deliveryToLat,
    required this.deliveryToLng,
    required this.customsItem,
    required this.wantStorage,
    required this.storageDays,
    required this.content,
    required this.steps,
    required this.shippingMethod,
    required this.total,
    required this.currencyId,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.files,
    required this.items,
    required this.shippingMethods,
    required this.currency,
    required this.shippingPort,
  });

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
    for (var parcelItem in shippingMethods) {
      parcelData.add(
        ParcelDataModel(
          quantity: TextEditingController(text: parcelItem.quantity),
          goodsType: parcelItem.goodTypeId.toString().obs,
          totalSize: TextEditingController(text: parcelItem.totalSize),
          totalWeight: TextEditingController(text: parcelItem.totalWeight),
          parcelType: (parcelItem.parcelType ?? '').obs,
          otherParcelName: TextEditingController(text: parcelItem.otherParcel),
        ),
      );
    }
    return parcelData;
  }

  List<ContainerDataModel> get containerDataList {
    List<ContainerDataModel> containerData = <ContainerDataModel>[];
    for (var containerItem in shippingMethods) {
      containerData.add(
        ContainerDataModel(
          containerSize: (containerItem.containerSize ?? '').obs,
          goodsType: containerItem.goodType!.name.obs,
          containerCount: TextEditingController(
            text: (int.tryParse(containerItem.containerCount ?? '0') ?? 0)
                .toString(),
          ),
          containerType: (containerItem.containerType ?? '').obs,
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

  factory CustomsClearanceOrder.fromJson(Map<String, dynamic> json) =>
      CustomsClearanceOrder(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        userId: json['user_id'] ?? 0,
        user: User.fromJson(json['user'] ?? {}),
        shipmentType: json['shipment_type'] ?? '',
        chargeField: json['charge_field'] ?? '',
        shippingPortId: json['shipping_port_id'] ?? 0,
        deliveryTo: json['delivery_to'] ?? '',
        deliveryToLat: json['delivery_to_lat'] ?? '',
        deliveryToLng: json['delivery_to_lng'] ?? '',
        customsItem: json['customs_item'] ?? 'no',
        wantStorage: json['want_storage'] ?? 'no',
        storageDays: json['storage_days'] ?? '0',
        content: json['content'] ?? '',
        shippingMethod: json['shipping_method'] ?? '',
        total: json['total'] ?? '',
        currencyId: json['currency_id'] ?? 0,
        notes: json['notes'] ?? '',
        status: json['status'] ?? '',
        certificate: json['certificate'] ?? 'no',
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        steps: List<OrderStepModel>.from(
            (json['steps'] ?? []).map((x) => OrderStepModel.fromJson(x))),
        certificates: List<DataModel>.from(
            (json['get_certificates'] ?? []).map((x) => DataModel.fromJson(x))),
        files: List<OrderFile>.from(
            (json['files'] ?? []).map((x) => OrderFile.fromJson(x))),
        items: List<DataModel>.from(
            (json['items'] ?? []).map((x) => DataModel.fromJson(x))),
        shippingMethods: List<ShippingMethod>.from(
            (json['shippingmethods'] ?? [])
                .map((x) => ShippingMethod.fromJson(x))),
        currency: DataModel.fromJson(json['currency'] ?? {}),
        shippingPort: DataModel.fromJson(json['shippingport'] ?? {}),
        offers: List<CustomsClearanceOffer>.from((json['offers'] ?? [])
            .map((x) => CustomsClearanceOffer.fromJson(x))),
        offersNum: List<CustomsClearanceOffer>.from((json['offers'] ?? [])
            .map((x) => CustomsClearanceOffer.fromJson(x))).length,
        feedback: json['feedback'] == null
            ? null
            : FeedbackObj.fromJson(json['feedback']),
        invoice: json['invoice'] == null
            ? null
            : CustomsClearanceInvoice.fromJson(json['invoice']),
        offer: json['offer'] == null
            ? null
            : CustomsClearanceOffer.fromJson(json['offer']),
        invoiceUrl: json['invoice_url'] ?? '',
      );

  @override
  List<OrderSectionItemModel> get data => [
        OrderSectionItemModel(
          title: 'معلومات الطلب',
          data: [
            OrderDetailsItemModel(
              title: 'عنوان الطلب',
              description: title,
            ),
            OrderDetailsItemModel(
              title: 'وصف البضاعة',
              description: content,
            ),
            OrderDetailsItemModel(
              title: 'منفذ الشحنة',
              description: shippingPort.name,
            ),
            OrderDetailsItemModel(
              title: 'نوع الشحنة',
              description: shipmentType.tr,
            ),
            OrderDetailsItemModel(
              title: 'الإجمالي',
              description: '$total ${currency.name}',
            ),
            OrderDetailsItemModel(
              title: 'نوع الشحن',
              description: shippingMethod.tr,
            ),
            OrderDetailsItemModel(
              title: 'توصيل إلي',
              description: deliveryTo,
              value: '$deliveryToLat,$deliveryToLng',
              type: OrderDetailsTypes.mapDirection,
            ),
            OrderDetailsItemModel(
              title: 'مجال الشحنة',
              description: chargeField,
            ),
            OrderDetailsItemModel(
              title: 'هل يوجد بند جمزكي',
              description: customsItem,
            ),
            for (var item in items) ...[
              OrderDetailsItemModel(
                title: 'رقم البند الجمركي',
                description: item.name,
              ),
            ]
          ],
        ),
        OrderSectionItemModel(
          title: 'الملفات',
          data: [
            for (var file in files) ...[
              OrderDetailsItemModel(
                title: 'ملف',
                description: file.url,
                type: OrderDetailsTypes.file,
              ),
            ],
            if (offers.isEmpty)
              OrderDetailsItemModel(
                title: 'أضف ملف',
                enableGesture: true,
                action: OrderDetailsAction.uploadFile,
              ),
          ],
        ),
        if (shippingMethod == 'parcel') ...[
          OrderSectionItemModel(
            title: 'طرد',
            data: [
              for (var item in shippingMethods) ...[
                OrderDetailsItemModel(
                  title: 'نوع البضاعة',
                  description: item.goodType!.name.toString(),
                ),
                OrderDetailsItemModel(
                  title: 'نوع الطرد',
                  description: item.parcelType,
                ),
                if ((item.otherParcel ?? '').isNotEmpty) ...[
                  OrderDetailsItemModel(
                    title: 'اسم الطرد',
                    description: item.otherParcel.toString(),
                  ),
                ],
                OrderDetailsItemModel(
                  title: 'إجمالي الحجم (متر مكعب)',
                  description: item.totalSize,
                ),
                OrderDetailsItemModel(
                  title: 'إجمالي الوزن (كيلوجرام)',
                  description: item.totalWeight,
                ),
                OrderDetailsItemModel(
                  title: 'الكمية',
                  description: item.quantity,
                ),
              ]
            ],
          ),
        ] else ...[
          OrderSectionItemModel(
            title: 'حاوية',
            data: [
              for (var item in shippingMethods) ...[
                OrderDetailsItemModel(
                  title: 'نوع البضاعة',
                  description: item.goodType!.name.toString(),
                ),
                OrderDetailsItemModel(
                  title: 'نوع الحاوية',
                  description: item.containerType,
                ),
                OrderDetailsItemModel(
                  title: 'حجم الحاوية',
                  description: item.containerSize,
                ),
                OrderDetailsItemModel(
                  title: 'عدد الحاويات',
                  description: item.containerCount,
                ),
              ]
            ],
          ),
        ],
        OrderSectionItemModel(
          title: 'خدمات إضافية',
          data: [
            OrderDetailsItemModel(
              title: 'هل تريد التخزين',
              description: storageDaysNumber > 0 ? 'yes' : 'no',
            ),
            if (storageDaysNumber > 0)
              OrderDetailsItemModel(
                title: 'عدد أيام التخزين',
                description: storageDays,
              ),
            for (var item in certificates) ...[
              OrderDetailsItemModel(
                title: item.name,
              ),
            ]
          ],
        ),
        OrderSectionItemModel(
          title: 'التواصل',
          data: [
            OrderDetailsItemModel(
              title: 'صاحب الطلب',
              description: user.name,
            ),
            if ((user.mobile ?? '').isNotEmpty)
              OrderDetailsItemModel(
                title: 'الجوال',
                description: user.mobile,
              ),
            if ((user.email ?? '').isNotEmpty)
              OrderDetailsItemModel(
                title: 'البريد الإلكتروني',
                description: user.email,
              ),
          ],
        ),
      ];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'user_id': userId,
        'user': user.toJson(),
        'shipment_type': shipmentType,
        'charge_field': chargeField,
        'shipping_port_id': shippingPortId,
        'delivery_to': deliveryTo,
        'customs_item': customsItem,
        'want_storage': wantStorage,
        'storage_days': storageDays,
        'content': content,
        'shipping_method': shippingMethod,
        'total': total,
        'currency_id': currencyId,
        'notes': notes,
        'status': status,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'steps': List<dynamic>.from(steps.map((x) => x)),
        'files': List<dynamic>.from(files.map((x) => x)),
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
        'shippingmethods':
            List<dynamic>.from(shippingMethods.map((x) => x.toJson())),
        'currency': currency.toJson(),
        'shippingport': shippingPort.toJson(),
        'offers': List<dynamic>.from(offers.map((x) => x)),
        'get_certificates': List<dynamic>.from(certificates.map((x) => x)),
        'invoice': (invoice! as CustomsClearanceInvoice).toJson(),
        'offer': (offer! as CustomsClearanceOffer).toJson(),
        'invoice_url': invoiceUrl,
        'certificate': certificates,
      };
}

class CustomsClearanceOffer extends OfferModel {
  CustomsClearanceOffer({
    super.id,
    super.userId,
    super.total,
    this.customClearanceId,
    this.firstContainer,
    this.extraContainer,
    this.singleCharge,
    this.transport,
    this.translate,
    this.unloading,
    this.deliveryPermits,
    this.shippingMethod,
    super.status,
    super.note,
    super.acceptedAt,
    super.rejectedAt,
    this.systemPercent,
    this.systemTax,
    this.settlementId,
    this.deletedAt,
    super.createdAt,
    super.updatedAt,
    super.user,
  });

  int? customClearanceId;
  String? firstContainer;
  String? extraContainer;
  String? singleCharge;
  String? transport;
  String? translate;
  String? unloading;
  String? deliveryPermits;
  String? shippingMethod;
  String? systemPercent;
  String? systemTax;
  int? settlementId;
  dynamic deletedAt;

  factory CustomsClearanceOffer.fromJson(Map<String, dynamic> json) {
    return CustomsClearanceOffer(
      id: json['id'] ?? 0,
      customClearanceId: json['custom_clearance_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      firstContainer: json['first_container'] ?? '',
      extraContainer: json['extra_container'] ?? '',
      singleCharge: json['single_charge'] ?? '',
      transport: json['transport'] ?? '',
      translate: json['translate'] ?? '',
      unloading: json['unloading'] ?? '',
      deliveryPermits: json['delivery_permits'] ?? '',
      total: json['total'] ?? '',
      shippingMethod: json['shipping_method'] ?? '',
      status: json['status'] ?? '',
      note: json['notes'] ?? '',
      acceptedAt: json['accepted_at'] == null
          ? null
          : DateTime.parse(json['accepted_at']!),
      rejectedAt: json['rejected_at'] == null
          ? null
          : DateTime.parse(json['rejected_at']!),
      createdAt:
          json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt']!),
      updatedAt:
          json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt']!),
      systemPercent: json['system_percent'] ?? '',
      systemTax: json['system_tax'] ?? '',
      settlementId: json['settlement_id'] ?? 0,
      deletedAt: json['deleted_at'],
      user: User.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'custom_clearance_id': customClearanceId,
        'user_id': userId,
        'first_container': firstContainer,
        'extra_container': extraContainer,
        'single_charge': singleCharge,
        'transport': transport,
        'translate': translate,
        'unloading': unloading,
        'delivery_permits': deliveryPermits,
        'total': total,
        'shipping_method': shippingMethod,
        'status': status,
        'note': note,
        'accepted_at': acceptedAt?.toIso8601String(),
        'rejected_at': rejectedAt,
        'system_percent': systemPercent,
        'system_tax': systemTax,
        'settlement_id': settlementId,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };

  @override
  List<ItemModel> get data => [
        ItemModel(
          text: 'سعر تخليص الحاوية',
          description: firstContainer,
        ),
        ItemModel(
          text: 'سعر تخليص حاوية اضافية',
          description: extraContainer,
        ),
        ItemModel(
          text: 'رسوم الخدمات الأخري',
          description: singleCharge,
        ),
        ItemModel(
          text: 'رسوم النقل',
          description: transport,
        ),
        ItemModel(
          text: 'رسوم الترجمة والتبنيد',
          description: translate,
        ),
        ItemModel(
          text: 'رسوم عمال تحميل وتفريغ',
          description: unloading,
        ),
        ItemModel(
          text: 'الضريبة المضافة',
          description: deliveryPermits,
        ),
        if (note != null)
          ItemModel(
            text: 'ملاحظات إضافية',
            description: note ?? '',
          ),
        ItemModel(
          text: 'الإجمالي شامل الضريبة',
          description: '$total ${'riyal_saudi'.tr}',
          mainItem: true,
        ),
        const ItemModel(
          text: 'تنوية هناك رسوم آخرى خلال العملية اللوجستية',
        ),
      ];
}

class CustomsClearanceInvoice extends Invoice {
  CustomsClearanceInvoice({
    this.customClearanceId,
    this.customClearancesOfferId,
    this.ship,
    this.ladingNumber,
    this.typeGoods,
    this.weight,
    this.containerCount,
    this.importListNumber,
    this.importListDate,
    this.totalWithoutTax,
    this.totalTax,
    super.user,
    super.total,
    super.id,
    super.updatedAt,
    super.createdAt,
    super.status,
    super.note,
    super.deletedAt,
    super.userId,
  });

  int? customClearanceId;
  int? customClearancesOfferId;
  String? totalWithoutTax;
  String? totalTax;
  String? importListDate;
  String? ship;
  String? ladingNumber;
  String? typeGoods;
  String? weight;
  String? containerCount;
  String? importListNumber;

  @override
  List<ItemModel> get items => [
        ItemModel(
          text: 'المستخدم',
          description: user?.name ?? '',
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
          description: '$totalWithoutTax ${'riyal_saudi'.tr}',
        ),
        ItemModel(
          text: 'الملاححظات',
          description: note,
        ),
        ItemModel(
          text: 'الإجمالي',
          description: '$total ${'riyal_saudi'.tr}',
          mainItem: true,
        ),
      ];

  factory CustomsClearanceInvoice.fromJson(Map<String, dynamic> json) =>
      CustomsClearanceInvoice(
        id: json['id'] ?? 0,
        userId: json['user_id'] ?? 0,
        totalWithoutTax: json['total_without_tax'] ?? '',
        totalTax: json['total_tax'] ?? '',
        total: json['total'] ?? '',
        note: json['note'] ?? '',
        status: json['status'] ?? '',
        deletedAt: json['deleted_at'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        user: User.fromJson(json['user'] ?? {}),
        importListDate: json['import_list_date'] ?? '',
        customClearanceId: json['custom_clearance_id'] ?? 0,
        customClearancesOfferId: json['custom_clearances_offer_id'] ?? 0,
        ship: json['ship'] ?? '',
        ladingNumber: json['lading_number'] ?? '',
        typeGoods: json['type_goods'] ?? '',
        weight: json['weight'] ?? '',
        containerCount: json['container_count'] ?? '',
        importListNumber: json['import_list_number'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'custom_clearance_id': customClearanceId,
        'custom_clearances_offer_id': customClearancesOfferId,
        'user_id': userId,
        'ship': ship,
        'lading_number': ladingNumber,
        'type_goods': typeGoods,
        'weight': weight,
        'container_count': containerCount,
        'import_list_number': importListNumber,
        'total_without_tax': totalWithoutTax,
        'total_tax': totalTax,
        'total': total,
        'note': note,
        'status': status,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
        'import_list_date': importListDate,
      };
}

class OrderStepModel {
  OrderStepModel({
    this.id,
    this.customClearanceId,
    this.customClearancesOfferId,
    this.userId,
    this.step,
    this.note,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.files,
  });

  int? id;
  int? customClearanceId;
  int? customClearancesOfferId;
  int? userId;
  String? step;
  String? note;
  String? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  List<OrderFile>? files;

  factory OrderStepModel.fromJson(Map<String, dynamic> json) => OrderStepModel(
        id: json['id'] ?? 0,
        customClearanceId: json['custom_clearance_id'] ?? 0,
        customClearancesOfferId: json['custom_clearances_offer_id'] ?? 0,
        userId: json['user_id'] ?? 0,
        step: json['step'] ?? 0,
        note: json['note'] ?? '',
        status: json['status'] ?? '',
        deletedAt: json['deleted_at'],
        createdAt:
            DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json['updated_at'] ?? DateTime.now().toString()),
        user: User.fromJson(json['user'] ?? {}),
        files: List<OrderFile>.from(
            json['files'].map((x) => OrderFile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'custom_clearance_id': customClearanceId,
        'custom_clearances_offer_id': customClearancesOfferId,
        'user_id': userId,
        'step': step,
        'note': note,
        'status': status,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
        'files': List<dynamic>.from(files?.map((x) => x) ?? []),
      };
}

class ShippingMethod {
  ShippingMethod({
    this.id,
    this.customClearanceId,
    this.goodTypeId,
    this.shippingMethod,
    this.parcelType,
    this.otherParcel,
    this.totalSize,
    this.totalWeight,
    this.quantity,
    this.containerType,
    this.containerSize,
    this.containerCount,
    this.deletedAt,
    this.createdAt,
    this.goodType,
    this.updatedAt,
  });

  int? id;
  int? customClearanceId;
  int? goodTypeId;
  DataModel? goodType;
  String? shippingMethod;
  String? parcelType;
  String? otherParcel;
  String? totalSize;
  String? totalWeight;
  String? quantity;
  String? containerType;
  String? containerSize;
  String? containerCount;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ShippingMethod.fromJson(Map<String, dynamic> json) => ShippingMethod(
        id: json['id'] ?? 0,
        customClearanceId: json['custom_clearance_id'] ?? 0,
        goodTypeId: json['good_type_id'] ?? 0,
        shippingMethod: json['shipping_method'] ?? '',
        parcelType: json['parcel_type'] ?? '',
        otherParcel: json['other_parcel'] ?? '',
        totalSize: json['total_size'] ?? '',
        totalWeight: json['total_weight'] ?? '',
        quantity: json['quantity'] ?? '',
        containerType: json['container_type'] ?? '',
        containerSize: json['container_size'] ?? '',
        containerCount: json['container_count'] ?? '',
        deletedAt: json['deleted_at'],
        goodType: DataModel.fromJson(json['goodtype'] ?? {}),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'custom_clearance_id': customClearanceId,
        'good_type_id': goodTypeId,
        'shipping_method': shippingMethod,
        'parcel_type': parcelType,
        'other_parcel': otherParcel,
        'total_size': totalSize,
        'total_weight': totalWeight,
        'quantity': quantity,
        'container_type': containerType,
        'container_size': containerSize,
        'container_count': containerCount,
        'deleted_at': deletedAt,
        'goodtype': goodType?.toJson(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
