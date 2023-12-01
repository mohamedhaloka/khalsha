part of 'order_model.dart';

class WareHouseOrder extends OrderModel {
  WareHouseOrder({
    required super.id,
    required super.title,
    required super.userId,
    required super.offers,
    required super.invoice,
    required super.offersNum,
    required super.offer,
    required super.user,
    required super.status,
    required super.certificates,
    required super.certificate,
    super.invoiceUrl,
    super.feedback,
    required this.itemId,
    required this.storingPurpose,
    required this.storingType,
    required this.spaceType,
    this.palletCounts,
    required this.warehouseSpace,
    this.customWarehouseSpace,
    required this.contractType,
    required this.contractCount,
    required this.address,
    required this.addressLat,
    required this.addressLng,
    required this.contractStartAt,
    required this.needPackaging,
    required this.exportCertificates,
    required this.importCertificates,
    required this.farmingProcedures,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.item,
  });

  int itemId;
  String storingPurpose;
  String storingType;
  String spaceType;
  int? palletCounts;
  String warehouseSpace;
  String? customWarehouseSpace;
  String contractType;
  int contractCount;
  String address;
  String addressLat;
  String addressLng;
  DateTime contractStartAt;
  String needPackaging;
  String exportCertificates;
  String importCertificates;
  String farmingProcedures;
  String notes;
  DateTime createdAt;
  DateTime updatedAt;
  DataModel item;

  int get storingPurposeId {
    if (storingPurpose == 'personal') {
      return 0;
    } else {
      return 1;
    }
  }

  factory WareHouseOrder.fromJson(Map<String, dynamic> json) => WareHouseOrder(
        id: json['id'],
        title: json['title'],
        userId: json['user_id'],
        itemId: json['item_id'],
        storingPurpose: json['storing_purpose'],
        storingType: json['storing_type'],
        spaceType: json['space_type'],
        palletCounts: json['pallet_counts'],
        warehouseSpace: json['warehouse_space'] ?? '',
        customWarehouseSpace: json['custom_warehouse_space'],
        contractType: json['contract_type'],
        contractCount: json['contract_count'],
        address: json['address'],
        addressLat: json['address_lat'],
        addressLng: json['address_lng'],
        contractStartAt: DateTime.parse(json['contract_start_at']),
        needPackaging: json['need_packaging'],
        exportCertificates: json['export_certificates'],
        importCertificates: json['import_certificates'],
        farmingProcedures: json['farming_procedures'],
        certificate: json['certificates'],
        notes: json['notes'],
        status: json['status'],
        invoiceUrl: json['invoice_url'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        user: User.fromJson(json['user'] ?? {}),
        feedback: json['feedback'] == null
            ? null
            : FeedbackObj.fromJson(json['feedback']),
        item: DataModel.fromJson(json['item'] ?? {}),
        certificates: List<DataModel>.from(
            (json['get_certificates'] ?? []).map((x) => DataModel.fromJson(x))),
        offers: List<WareHouseOffer>.from(
            (json['offers'] ?? []).map((x) => WareHouseOffer.fromJson(x))),
        invoice: json['invoice'] is List
            ? null
            : json['invoice'] == null
                ? null
                : WareHouseInvoice.fromJson(json['invoice']),
        offersNum: List<WareHouseOffer>.from(
          (json['offers'] ?? []).map((x) => WareHouseOffer.fromJson(x)),
        ).length,
        offer: json['offer'] == null
            ? null
            : WareHouseOffer.fromJson(json['offer']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'user_id': userId,
        'item_id': itemId,
        'storing_purpose': storingPurpose,
        'storing_type': storingType,
        'space_type': spaceType,
        'pallet_counts': palletCounts,
        'warehouse_space': warehouseSpace,
        'custom_warehouse_space': customWarehouseSpace,
        'contract_type': contractType,
        'contract_count': contractCount,
        'address': address,
        'address_lat': addressLat,
        'address_lng': addressLng,
        'invoice_url': invoiceUrl,
        'contract_start_at': contractStartAt.toIso8601String(),
        'need_packaging': needPackaging,
        'export_certificates': exportCertificates,
        'import_certificates': importCertificates,
        'farming_procedures': farmingProcedures,
        'certificates': certificates,
        'notes': notes,
        'status': status,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'user': user.toJson(),
        'feedback': feedback,
        'item': item.toJson(),
        'get_certificates':
            List<dynamic>.from(certificates.map((x) => x.toJson())),
        'offers': List<dynamic>.from(offers.map((x) => x)),
        'invoice': '',
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
              title: 'الغرض من التخزين',
              description: storingPurpose,
            ),
            OrderDetailsItemModel(
              title: 'نوع التخزين',
              description: storingType,
            ),
            if (spaceType == 'pallet') ...[
              OrderDetailsItemModel(
                title: 'عدد الطبليات',
                description: palletCounts.toString(),
              ),
            ] else ...[
              OrderDetailsItemModel(
                title: 'نوع المساحة',
                description: spaceType,
              ),
              OrderDetailsItemModel(
                title: 'ما هي المساحة التي تحتاجها',
                description: warehouseSpace,
              ),
              if (warehouseSpace == 'custom') ...[
                OrderDetailsItemModel(
                  title: 'ما هي المساحة بالمتر المربع',
                  description: customWarehouseSpace,
                ),
              ],
            ],
            OrderDetailsItemModel(
              title: 'العنوان/ المدينه',
              description: address,
            ),
            OrderDetailsItemModel(
              title: 'إستخراج الشهادات المطلوبة لهذه الشحنة',
              description: certificate,
            ),
            OrderDetailsItemModel(
              title: 'نوع التعاقد',
              description: contractType,
            ),
            OrderDetailsItemModel(
              title: 'مدة التعاقد',
              description: contractCount.toString(),
            ),
            OrderDetailsItemModel(
              title: 'بداية التعاقد',
              description: contractStartAt.toString(),
            ),
            OrderDetailsItemModel(
              title: 'هل تريد خدمة التغليف',
              description: needPackaging,
            ),
            OrderDetailsItemModel(
              title: 'الخدمة في تسجيل المنتجات بالهيئة',
              description: importCertificates,
            ),
            OrderDetailsItemModel(
              title: 'الخدمة في استخراج تراخيص الشركات والمؤسسات للاستيراد',
              description: exportCertificates,
            ),
            OrderDetailsItemModel(
              title: 'الخدمة في تخليص اجراءات وزارة الزراعة',
              description: farmingProcedures,
            ),
          ],
        ),
        OrderSectionItemModel(
          title: 'ملاحظات علي الطلب',
          data: [
            OrderDetailsItemModel(
              title: notes,
            ),
          ],
        ),
        if (certificates.isNotEmpty)
          OrderSectionItemModel(
            title: 'الشهادات',
            data: [
              for (var item in certificates) ...[
                OrderDetailsItemModel(title: item.name),
              ]
            ],
          ),
        OrderSectionItemModel(
          title: 'التواصل',
          data: [
            OrderDetailsItemModel(title: 'صاحب الطلب', description: user.name),
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

class WareHouseInvoice extends Invoice {
  WareHouseInvoice({
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

  factory WareHouseInvoice.fromJson(Map<String, dynamic> json) =>
      WareHouseInvoice(
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

class WareHouseOffer extends OfferModel {
  WareHouseOffer({
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
  });

  factory WareHouseOffer.fromJson(Map<String, dynamic> json) => WareHouseOffer(
        id: json['id'] ?? 0,
        userId: json['user_id'] ?? 0,
        status: json['status'] ?? '',
        note: json['note'] ?? '',
        total: json['total'] ?? '',
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
        'accepted_at': acceptedAt?.toIso8601String(),
        'rejected_at': rejectedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };

  @override
  List<ItemModel> get data => [
        ItemModel(
          text: 'الإجمالي',
          description: '$total ${'riyal_saudi'.tr}',
          mainItem: true,
        ),
        if (note != null) ItemModel(text: 'الملاحظات', description: note ?? ''),
      ];
}
