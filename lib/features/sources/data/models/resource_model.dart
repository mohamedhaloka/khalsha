class ResourceModel {
  final int? id;
  final String? title;
  final String? image;

  ResourceModel({
    this.id,
    this.title,
    this.image,
  });

  factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
