class ResourceModel {
  final int? id;
  final String? title;
  final ListClassModel? list;
  final String? image;

  ResourceModel({
    this.id,
    this.title,
    this.list,
    this.image,
  });

  factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel(
        id: json["id"],
        title: json["title"],
        list:
            json["list"] == null ? null : ListClassModel.fromJson(json["list"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "list": list?.toJson(),
        "image": image,
      };
}

class ListClassModel {
  final int? id;
  final String? name;

  ListClassModel({
    this.id,
    this.name,
  });

  factory ListClassModel.fromJson(Map<String, dynamic> json) => ListClassModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
