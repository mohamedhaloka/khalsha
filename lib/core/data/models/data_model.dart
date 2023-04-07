class DataModel {
  DataModel({
    required this.id,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  int id;
  String status;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String name;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
      );

  factory DataModel.empty() => DataModel(
        id: 0,
        status: '',
        deletedAt: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        name: '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
      };
}
