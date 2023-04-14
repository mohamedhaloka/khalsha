import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DataModel {
  DataModel({
    required this.id,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.selected,
  });

  int id;
  String status;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  RxBool selected;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"] ?? 0,
        status: json["status"] ?? '',
        deletedAt: json["deleted_at"],
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        name: json["name"] ?? '',
        selected: false.obs,
      );

  factory DataModel.empty() => DataModel(
        id: 0,
        selected: false.obs,
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

  DataModel copyWith(
          {int? id,
          RxBool? selected,
          String? status,
          dynamic deletedAt,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? name}) =>
      DataModel(
        id: id ?? this.id,
        selected: selected ?? this.selected,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
      );
}
