class PostModel {
  final int? id;
  final String? title;
  final Author? author;
  final Author? category;
  final String? image;
  final String? content;
  final DateTime? createdAt;

  PostModel({
    this.id,
    this.title,
    this.author,
    this.category,
    this.image,
    this.content,
    this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'],
        title: json['title'],
        author: json['author'] == null ? null : Author.fromJson(json['author']),
        category:
            json['category'] == null ? null : Author.fromJson(json['category']),
        image: json['image'],
        content: json['content'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author?.toJson(),
        'category': category?.toJson(),
        'image': image,
        'content': content,
        'created_at': createdAt?.toIso8601String(),
      };
}

class Author {
  final int? id;
  final String? name;

  Author({
    this.id,
    this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
