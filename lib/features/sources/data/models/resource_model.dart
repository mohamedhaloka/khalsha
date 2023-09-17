class ResourceModel {
  final int? id;
  final String? title;
  final String? image;
  final String? contentImage;

  ResourceModel({
    this.id,
    this.title,
    this.image,
    this.contentImage,
  });

  factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        contentImage: json["content_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "content_image": contentImage,
      };
}
