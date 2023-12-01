part of 'order_model.dart';

class LandShippingOrder extends OrderModel {
  String internationalShipping;
  String goodsType;
  String shippingType;
  String? workers;
  String flammable;
  String? wantStorage;
  int? storageDays;
  int? fromCountryId;
  int? toCountryId;
  String content;
  int? shipmentTypeId;
  int? truckId;
  String recipientName;
  String recipientMobile;
  DateTime loadingDate;
  DateTime deliveryDate;
  String? note;
  DateTime createdAt;
  DateTime updatedAt;
  DataModel? fromCountry;
  DataModel? toCountry;
  DataModel? shipmentType;
  DataModel? truck;
  List<LandShippingLocation> locations;
  List<LandShippingBundledGood> bundledGoods;
  List<ExtraServiceModel> extraServices;
  List<OrderFile>? files;

  LandShippingOrder({
    required super.id,
    required super.title,
    required super.userId,
    required this.internationalShipping,
    required this.goodsType,
    required this.shippingType,
    this.workers,
    required this.flammable,
    this.wantStorage,
    this.storageDays,
    this.fromCountryId,
    this.toCountryId,
    required this.content,
    required this.shipmentTypeId,
    required this.truckId,
    required this.recipientName,
    required this.recipientMobile,
    this.files,
    required this.loadingDate,
    required this.deliveryDate,
    this.note,
    required super.status,
    required this.createdAt,
    required this.updatedAt,
    required super.user,
    super.feedback,
    this.fromCountry,
    this.toCountry,
    this.shipmentType,
    this.truck,
    required this.locations,
    required this.bundledGoods,
    required this.extraServices,
    required super.offers,
    required super.invoice,
    required super.invoiceUrl,
    required super.offersNum,
    required super.offer,
    required super.certificates,
    required super.certificate,
  });

  bool get internationalShippingBooleanValue {
    if (internationalShipping == 'yes') return true;
    return false;
  }

  int get goodsTypeId {
    if (goodsType == 'bundled_goods') return 0;
    return 1;
  }

  factory LandShippingOrder.fromJson(Map<String, dynamic> json) =>
      LandShippingOrder(
        id: json['id'],
        title: json['title'],
        userId: json['user_id'],
        internationalShipping: json['international_shipping'],
        goodsType: json['goods_type'] ?? '',
        shippingType: json['shipping_type'] ?? '',
        workers: json['workers'],
        flammable: json['flammable'],
        wantStorage: json['want_storage'],
        storageDays: json['storage_days'],
        fromCountryId: json['fromcountry_id'],
        toCountryId: json['tocountry_id'],
        content: json['content'],
        shipmentTypeId: json['shipmenttype_id'],
        truckId: json['truck_id'],
        recipientName: json['recipient_name'],
        recipientMobile: json['recipient_mobile'],
        loadingDate: DateTime.parse(json['loading_date']),
        deliveryDate: DateTime.parse(json['delivery_date']),
        note: json['note'],
        status: json['status'],
        files: List<OrderFile>.from(
            (json['files'] ?? []).map((x) => OrderFile.fromJson(x))),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        user: User.fromJson(json['user'] ?? {}),
        feedback: json['feedback'] == null
            ? null
            : FeedbackObj.fromJson(json['feedback']),
        fromCountry: json['fromcountry'] == null
            ? null
            : DataModel.fromJson(json['fromcountry']),
        toCountry: json['tocountry'] == null
            ? null
            : DataModel.fromJson(json['tocountry']),
        shipmentType: json['shipmenttype'] == null
            ? null
            : DataModel.fromJson(json['shipmenttype']),
        truck: json['truck'] == null ? null : DataModel.fromJson(json['truck']),
        locations: List<LandShippingLocation>.from((json['locations'] ?? [])
            .map((x) => LandShippingLocation.fromJson(x))),
        bundledGoods: List<LandShippingBundledGood>.from(
            (json['bundled_goods'] ?? [])
                .map((x) => LandShippingBundledGood.fromJson(x))),
        extraServices: List<ExtraServiceModel>.from(
            (json['extraservices'] ?? [])
                .map((x) => ExtraServiceModel.fromJson(x))),
        offers: List<LandShippingOffer>.from(
            (json['offers'] ?? []).map((x) => LandShippingOffer.fromJson(x))),
        invoice: json['invoice'] is List
            ? null
            : json['invoice'] == null
                ? null
                : LandShippingInvoice.fromJson(json['invoice']),
        invoiceUrl: json['invoice_url'],
        offersNum: List<LandShippingOffer>.from((json['offers'] ?? [])
            .map((x) => LandShippingOffer.fromJson(x))).length,
        offer: json['offer'] == null
            ? null
            : LandShippingOffer.fromJson(json['offer']),
        certificates: List<DataModel>.from(
            (json['get_certificates'] ?? []).map((x) => DataModel.fromJson(x))),
        certificate: json['certificate'] ?? 'no',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'user_id': userId,
        'international_shipping': internationalShipping,
        'goods_type': goodsType,
        'shipping_type': shippingType,
        'workers': workers,
        'flammable': flammable,
        'want_storage': wantStorage,
        'storage_days': storageDays,
        'fromcountry_id': fromCountryId,
        'tocountry_id': toCountryId,
        'content': content,
        'shipmenttype_id': shipmentTypeId,
        'truck_id': truckId,
        'recipient_name': recipientName,
        'recipient_mobile': recipientMobile,
        'loading_date': loadingDate.toIso8601String(),
        'delivery_date': deliveryDate.toIso8601String(),
        'note': note,
        'status': status,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'user': user.toJson(),
        'feedback': feedback,
        'files': List<dynamic>.from((files ?? []).map((x) => x)),
        'fromcountry': fromCountry?.toJson(),
        'tocountry': toCountry?.toJson(),
        'shipmenttype': shipmentType?.toJson(),
        'truck': truck?.toJson(),
        'locations': List<dynamic>.from(locations.map((x) => x.toJson())),
        'bundled_goods':
            List<dynamic>.from(bundledGoods.map((x) => x.toJson())),
        'extraservices': List<dynamic>.from(extraServices.map((x) => x)),
        'offers': List<dynamic>.from(offers.map((x) => x)),
        'invoice': '',
        'invoice_url': invoiceUrl,
      };

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
              title: 'شحن دولي',
              description: internationalShipping,
            ),
            OrderDetailsItemModel(
              title: 'نوع الشحن',
              description: shippingType,
            ),
            if (workers != null && goodsType == 'private_transfer')
              OrderDetailsItemModel(
                title: 'تريد عمال تحميل وتنزيل',
                description: workers,
              ),
            OrderDetailsItemModel(
              title: 'قابل للاشتعال',
              description: flammable,
            ),
            if (truck != null && goodsType == 'private_transfer')
              OrderDetailsItemModel(
                title: 'نوع الشاحنة',
                description: truck?.name,
              ),
            if (shipmentType != null && goodsType == 'private_transfer')
              OrderDetailsItemModel(
                title: 'نوع الشحنة',
                description: shipmentType?.name,
              ),
            if (wantStorage != null && goodsType == 'private_transfer') ...[
              OrderDetailsItemModel(
                title: 'هل تريد التخزين',
                description: wantStorage,
              ),
              if (wantStorage == 'yes')
                OrderDetailsItemModel(
                  title: 'عدد ايام التخزين',
                  description: (storageDays ?? 0).toString(),
                ),
              OrderDetailsItemModel(
                title: 'اسم المستلم',
                description: recipientName,
              ),
              OrderDetailsItemModel(
                title: 'رقم هاتف المستلم',
                description: recipientMobile,
              ),
            ],
            OrderDetailsItemModel(
              title: 'وصف الشحنة',
              description: content,
            ),
            if ((note ?? '').isNotEmpty)
              OrderDetailsItemModel(
                title: 'ملاحظات إضافية',
                description: note,
              ),
            OrderDetailsItemModel(
              title: 'تاريخ التحميل',
              description: loadingDate.formatTime('dd/MM/yyyy'),
            ),
            OrderDetailsItemModel(
              title: 'تاريخ التسليم',
              description: loadingDate.formatTime('dd/MM/yyyy'),
            ),
          ],
        ),
        OrderSectionItemModel(
          title: 'الملفات',
          data: [
            for (var file in files ?? <OrderFile>[]) ...[
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
        OrderSectionItemModel(
          title: 'مواقع التحميل و التسليم',
          data: [
            for (int i = 0; i < locations.length; i++) ...[
              OrderDetailsItemModel(
                title: '#${i + 1}',
              ),
              OrderDetailsItemModel(
                title: 'موقع التحميل / المدينة',
                description: locations[i].loading,
                value: '${locations[i].loadingLat},${locations[i].loadingLng}',
                type: OrderDetailsTypes.mapDirection,
              ),
              if (goodsType == 'private_transfer')
                OrderDetailsItemModel(
                  title: 'وصف موقع التحميل',
                  description: locations[i].descLoading,
                ),
              OrderDetailsItemModel(
                title: 'موقع التسليم/ المدينة',
                description: locations[i].delivery,
                value:
                    '${locations[i].deliveryLat},${locations[i].deliveryLng}',
                type: OrderDetailsTypes.mapDirection,
              ),
              if (goodsType == 'private_transfer')
                OrderDetailsItemModel(
                  title: 'وصف موقع التسليم',
                  description: locations[i].descDelivery,
                ),
            ]
          ],
        ),
        if (bundledGoods.isNotEmpty && goodsType != 'private_transfer')
          OrderSectionItemModel(
            title: 'الاصناف',
            data: [
              for (int i = 0; i < bundledGoods.length; i++) ...[
                OrderDetailsItemModel(
                  title: '#${i + 1}',
                ),
                OrderDetailsItemModel(
                  title: 'اسم الصنف',
                  description: bundledGoods[i].name,
                ),
                OrderDetailsItemModel(
                  title: 'الكمية',
                  description: bundledGoods[i].quantity.toString(),
                ),
                OrderDetailsItemModel(
                  title: 'وحدة',
                  description: bundledGoods[i].unit.tr,
                ),
                OrderDetailsItemModel(
                  title: 'إجمالي الوزن',
                  description: bundledGoods[i].totalWeight,
                ),
                OrderDetailsItemModel(
                  title: 'صورة الشحنة',
                  description: bundledGoods[i].image,
                  type: OrderDetailsTypes.file,
                ),
              ]
            ],
          ),
        if (extraServices.isNotEmpty)
          OrderSectionItemModel(
            title: 'الخدمات الإضافية',
            data: [
              for (int i = 0; i < extraServices.length; i++) ...[
                OrderDetailsItemModel(
                  title: '#${i + 1}',
                ),
                OrderDetailsItemModel(
                  title: 'اسم الصنف',
                  description: extraServices[i].name,
                ),
                OrderDetailsItemModel(
                  title: 'الكمية',
                  description: extraServices[i].quantity.toString(),
                ),
                OrderDetailsItemModel(
                  title: 'pack'.tr,
                  description: extraServices[i].pack,
                ),
                OrderDetailsItemModel(
                  title: 'unpack'.tr,
                  description: extraServices[i].unpack,
                ),
                OrderDetailsItemModel(
                  title: 'packaging'.tr,
                  description: extraServices[i].packaging,
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
}

class ExtraServiceModel {
  int id;
  String name;
  int quantity;
  String pack;
  String unpack;
  String packaging;
  int landShippingId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  ExtraServiceModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.pack,
    required this.unpack,
    required this.packaging,
    required this.landShippingId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExtraServiceModel.fromJson(Map<String, dynamic> json) =>
      ExtraServiceModel(
        id: json['id'],
        name: json['name'],
        quantity: json['quantity'],
        pack: json['pack'],
        unpack: json['unpack'],
        packaging: json['packaging'],
        landShippingId: json['land_shipping_id'],
        deletedAt: json['deleted_at'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'pack': pack,
        'unpack': unpack,
        'packaging': packaging,
        'land_shipping_id': landShippingId,
        'deleted_at': deletedAt,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}

class LandShippingBundledGood {
  int id;
  int landShippingId;
  String name;
  int quantity;
  String unit;
  String totalWeight;
  String image;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  LandShippingBundledGood({
    required this.id,
    required this.landShippingId,
    required this.name,
    required this.quantity,
    required this.unit,
    required this.totalWeight,
    required this.image,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LandShippingBundledGood.fromJson(Map<String, dynamic> json) =>
      LandShippingBundledGood(
        id: json['id'],
        landShippingId: json['land_shipping_id'],
        name: json['name'],
        quantity: json['quantity'],
        unit: json['unit'],
        totalWeight: json['total_weight'],
        image: json['image'],
        deletedAt: json['deleted_at'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'land_shipping_id': landShippingId,
        'name': name,
        'quantity': quantity,
        'unit': unit,
        'total_weight': totalWeight,
        'image': image,
        'deleted_at': deletedAt,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}

class LandShippingInvoice extends Invoice {
  LandShippingInvoice({
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

  factory LandShippingInvoice.fromJson(Map<String, dynamic> json) =>
      LandShippingInvoice(
        id: json['id'] ?? 0,
        userId: json['user_id'] ?? 0,
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
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'total': total,
        'note': note,
        'status': status,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };

  @override
  List<ItemModel> get items => <ItemModel>[
        ItemModel(
          text: 'ملاحظات',
          description: note,
        )
      ];
}

class LandShippingOffer extends OfferModel {
  LandShippingOffer({
    super.id,
    super.userId,
    super.status,
    super.note,
    super.acceptedAt,
    super.rejectedAt,
    super.createdAt,
    super.updatedAt,
    super.user,
    super.total,
    required this.loading,
    required this.packUnpack,
    required this.storage,
  });

  final String loading;
  final String packUnpack;
  final String storage;

  factory LandShippingOffer.fromJson(Map<String, dynamic> json) =>
      LandShippingOffer(
        id: json['id'] ?? 0,
        userId: json['user_id'] ?? 0,
        status: json['status'] ?? '',
        note: json['note'] ?? '',
        total: json['total'] ?? '',
        storage: json['storage'] ?? '',
        packUnpack: json['pack_unpack'] ?? '',
        loading: json['loading'] ?? '',
        acceptedAt: json['accepted_at'] == null
            ? null
            : DateTime.parse(json['accepted_at']!),
        rejectedAt: json['rejected_at'] == null
            ? null
            : DateTime.parse(json['rejected_at']!),
        createdAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']!),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']!),
        user: User.fromJson(json['user'] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'note': note,
        'pack_unpack': packUnpack,
        'storage': storage,
        'loading': loading,
        'accepted_at': acceptedAt?.toIso8601String(),
        'rejected_at': rejectedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };

  @override
  List<ItemModel> get data => [
        ItemModel(
          text: 'رسوم النقل',
          description: loading,
        ),
        ItemModel(
          text: 'رسوم الخدمات',
          description: packUnpack,
        ),
        ItemModel(
          text: 'التخزين',
          description: storage,
        ),
        if (note != null) ItemModel(text: 'الملاحظات', description: note ?? ''),
        ItemModel(
          text: 'الإجمالي',
          description: '$total ${'riyal_saudi'.tr}',
          mainItem: true,
        ),
      ];
}

class LandShippingLocation {
  int id;
  String loading;
  String descLoading;
  String delivery;
  String descDelivery;
  String loadingLat;
  String loadingLng;
  String deliveryLat;
  String deliveryLng;
  int landShippingId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  LandShippingLocation({
    required this.id,
    required this.loading,
    required this.descLoading,
    required this.delivery,
    required this.descDelivery,
    required this.loadingLat,
    required this.loadingLng,
    required this.deliveryLat,
    required this.deliveryLng,
    required this.landShippingId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LandShippingLocation.fromJson(Map<String, dynamic> json) =>
      LandShippingLocation(
        id: json['id'],
        loading: json['loading'],
        descLoading: json['desc_loading'],
        delivery: json['delivery'],
        descDelivery: json['desc_delivery'],
        loadingLat: json['loading_lat'],
        loadingLng: json['loading_lng'],
        deliveryLat: json['delivery_lat'],
        deliveryLng: json['delivery_lng'],
        landShippingId: json['land_shipping_id'],
        deletedAt: json['deleted_at'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'loading': loading,
        'desc_loading': descLoading,
        'delivery': delivery,
        'desc_delivery': descDelivery,
        'loading_lat': loadingLat,
        'loading_lng': loadingLng,
        'delivery_lat': deliveryLat,
        'delivery_lng': deliveryLng,
        'land_shipping_id': landShippingId,
        'deleted_at': deletedAt,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
