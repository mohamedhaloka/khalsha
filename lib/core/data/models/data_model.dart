import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DataModel {
  DataModel({
    required this.id,
    required this.status,
    required this.icon,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.selected,
  });

  int id;
  String status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String icon;
  String name;
  RxBool selected;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json['id'] ?? 0,
        status: json['status'] ?? '',
        icon: json['icon'] ?? '',
        deletedAt: json['deleted_at'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        name: json['name'] ?? '',
        selected: false.obs,
      );

  factory DataModel.initial([String? text]) => DataModel(
        id: 0,
        selected: false.obs,
        status: '',
        deletedAt: '',
        icon: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        name: text ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'icon': icon,
        'status': status,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'name': name,
      };

  DataModel copyWith(
          {int? id,
          RxBool? selected,
          String? icon,
          String? status,
          dynamic deletedAt,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? name}) =>
      DataModel(
        id: id ?? this.id,
        selected: selected ?? this.selected,
        icon: icon ?? this.icon,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
      );
}
