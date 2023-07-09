class RuleModel {
  final int? id;
  final String? name;
  final String? content;
  final DateTime? createdAt;

  RuleModel({
    this.id,
    this.name,
    this.content,
    this.createdAt,
  });

  factory RuleModel.fromJson(Map<String, dynamic> json) => RuleModel(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
      };
}
