part of 'order_model.dart';

class LaboratoryOrder extends OrderModel {
  LaboratoryOrder({
    required super.id,
    required super.title,
    required super.userId,
    required super.user,
    required this.testReport,
    this.testReportPhoto,
    required this.factoryAudit,
    this.factoryAuditPhoto,
    required this.items,
    this.notes,
    required super.status,
    required super.certificates,
    required this.createdAt,
    required this.updatedAt,
    required super.feedback,
    required super.offers,
    super.invoice,
    super.invoiceUrl,
    required super.offersNum,
    required super.offer,
    required super.certificate,
  });

  String testReport;
  String? testReportPhoto;
  String factoryAudit;
  String? factoryAuditPhoto;
  String? notes;
  DateTime createdAt;
  DateTime updatedAt;
  List<LaboratoryOrderItem> items;

  factory LaboratoryOrder.fromJson(Map<String, dynamic> json) =>
      LaboratoryOrder(
        id: json["id"],
        title: json["title"],
        userId: json["user_id"],
        user: User.fromJson(json["user"] ?? {}),
        testReport: json["test_report"],
        testReportPhoto: json["test_report_photo"],
        factoryAudit: json["factory_audit"],
        factoryAuditPhoto: json["factory_audit_photo"],
        notes: json["notes"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        feedback: json["feedback"] == null
            ? null
            : FeedbackObj.fromJson(json["feedback"]),
        certificates: List<DataModel>.from(
            (json["get_certificates"] ?? []).map((x) => DataModel.fromJson(x))),
        offers: List<LaboratoryOffer>.from(
            (json["offers"] ?? []).map((x) => LaboratoryOffer.fromJson(x))),
        items: List<LaboratoryOrderItem>.from(
            (json["items"] ?? []).map((x) => LaboratoryOrderItem.fromJson(x))),
        invoice: json["invoice"] == null
            ? null
            : LaboratoryInvoice.fromJson(json["invoice"]),
        invoiceUrl: json["invoice_url"],
        offersNum: List<LaboratoryOffer>.from(
                (json["offers"] ?? []).map((x) => LaboratoryOffer.fromJson(x)))
            .length,
        offer: json['offer'] == null
            ? null
            : LaboratoryOffer.fromJson(json['offer']),
        certificate: json["certificate"] ?? 'no',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "user_id": userId,
        "user": user.toJson(),
        "test_report": testReport,
        "test_report_photo": testReportPhoto,
        "factory_audit": factoryAudit,
        "factory_audit_photo": factoryAuditPhoto,
        "notes": notes,
        "status": status,
        "certificates": certificates,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "feedback": feedback?.toJson(),
        "get_certificates":
            List<dynamic>.from(certificates.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "offers": List<dynamic>.from(
            offers.map((x) => (x as LaboratoryOffer).toJson())),
        "invoice": (invoice as LaboratoryInvoice).toJson(),
        "invoice_url": invoiceUrl,
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
            if (testReport == 'yes')
              OrderDetailsItemModel(
                title: 'هل يتوفر Test Report',
                description: testReportPhoto,
                type: OrderDetailsTypes.file,
              ),
            if (factoryAudit == 'yes')
              OrderDetailsItemModel(
                title: 'هل يتوفر Factory Audit Report',
                description: factoryAuditPhoto,
                type: OrderDetailsTypes.file,
              ),
            OrderDetailsItemModel(
              title: 'استخراج الشهادات المطلوبة لهذه الشحنة ؟',
              description: certificate,
            ),
            if (notes != null)
              OrderDetailsItemModel(
                title: 'الملاحظات',
                description: notes,
              ),
          ],
        ),
        if (items.isNotEmpty)
          OrderSectionItemModel(
            title: 'أصناف الطلب',
            data: [
              for (var item in items) ...[
                OrderDetailsItemModel(
                  title: 'اسم الصنف بالعربي',
                  description: item.name,
                ),
                OrderDetailsItemModel(
                  title: 'اسم الصنف بالانجليزي',
                  description: item.name,
                ),
                OrderDetailsItemModel(
                  title: 'الرمز الجمركي',
                  description: item.customsCode,
                ),
                OrderDetailsItemModel(
                  title: 'اسم المصنع / المورد',
                  description: item.factoryName,
                ),
                OrderDetailsItemModel(
                  title: 'الغرض من الخدمة',
                  description: item.itemServiceId.toString(),
                ),
                OrderDetailsItemModel(
                  title: 'صورة من البطاقة الايضاحية',
                  description: item.photoCard,
                  type: OrderDetailsTypes.file,
                ),
                OrderDetailsItemModel(
                  title: 'صورة الصنف',
                  description: item.photoItem,
                  type: OrderDetailsTypes.file,
                ),
              ]
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
            OrderDetailsItemModel(title: 'الجوال', description: ''),
            OrderDetailsItemModel(title: 'البريد الإلكتروني', description: ''),
          ],
        ),
      ];
}

class LaboratoryInvoice extends Invoice {
  LaboratoryInvoice({
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

  factory LaboratoryInvoice.fromJson(Map<String, dynamic> json) =>
      LaboratoryInvoice(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
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
        "user_id": userId,
        "total": total,
        "note": note,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };

  @override
  List<ItemModel> get items => <ItemModel>[
        ItemModel(
          text: 'ملاحظات',
          description: note,
        )
      ];
}

class LaboratoryOffer extends OfferModel {
  LaboratoryOffer({
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
    required this.feeIncluded,
  });

  String feeIncluded;

  factory LaboratoryOffer.fromJson(Map<String, dynamic> json) =>
      LaboratoryOffer(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
        status: json["status"] ?? '',
        note: json["note"] ?? '',
        total: json["total"] ?? '',
        feeIncluded: json["fee_included"] ?? 'no',
        acceptedAt:
            DateTime.parse(json["accepted_at"] ?? DateTime.now().toString()),
        rejectedAt: json["rejected_at"],
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        user: User.fromJson(json["user"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "note": note,
        "accepted_at": acceptedAt?.toIso8601String(),
        "rejected_at": rejectedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };

  @override
  List<ItemModel> get data => [
        ItemModel(
          text: 'شامل رسوم اصدار الشهادات',
          description: feeIncluded,
        ),
        if (note != null) ItemModel(text: 'الملاحظات', description: note ?? ''),
        ItemModel(
          text: 'الإجمالي',
          description: total,
          mainItem: true,
        ),
        const ItemModel(
          text: 'تنوية هناك رسوم آخرى خلال العملية اللوجستية',
        ),
      ];
}

class LaboratoryOrderItem {
  LaboratoryOrderItem({
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
    this.name,
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
  String? name;

  factory LaboratoryOrderItem.fromJson(Map<String, dynamic> json) =>
      LaboratoryOrderItem(
        id: json["id"],
        laboratoryId: json["laboratory_id"],
        itemServiceId: json["item_service_id"],
        customsCode: json["customs_code"],
        factoryName: json["factory_name"],
        photoCard: json["photo_card"],
        photoItem: json["photo_item"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
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
