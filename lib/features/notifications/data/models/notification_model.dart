class NotificationModel {
  int id;
  int moduleId;
  String moduleKey;
  String text;
  FromModel from;

  NotificationModel({
    required this.id,
    required this.moduleId,
    required this.moduleKey,
    required this.text,
    required this.from,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        moduleId: json["module_id"],
        moduleKey: json["module_key"],
        text: json["text"],
        from: FromModel.fromJson(json["from"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "module_id": moduleId,
        "module_key": moduleKey,
        "text": text,
        "from": from.toJson(),
      };
}

class FromModel {
  int id;
  String name;
  String photoProfile;

  FromModel({
    required this.id,
    required this.name,
    required this.photoProfile,
  });

  factory FromModel.fromJson(Map<String, dynamic> json) => FromModel(
        id: json["id"],
        name: json["name"],
        photoProfile: json["photo_profile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo_profile": photoProfile,
      };
}
