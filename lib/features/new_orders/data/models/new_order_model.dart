class NewOrderModel {
  NewOrderModel({
    required this.id,
    required this.title,
    required this.status,
    required this.userId,
    // required this.user,
  });

  int id;
  String title;
  String status;
  int userId;
  // User user;

  factory NewOrderModel.fromJson(Map<String, dynamic> json) => NewOrderModel(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        userId: json["user_id"],
        // user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "user_id": userId,
        // "user": user.toJson(),
      };
}
