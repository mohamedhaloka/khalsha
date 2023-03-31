// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.user,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  User get dataOrNull {
    if (user == null) {
      return User();
    }
    return user!;
  }

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.photoProfile,
    this.taxNumber,
    this.bio,
    this.userType,
    this.ratingsCount,
    this.ratingsStatistics,
    this.ratingsOverall,
    this.accountStatus,
    this.accountReason,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? mobile;
  String? email;
  String? photoProfile;
  String? taxNumber;
  String? bio;
  String? userType;
  int? ratingsCount;
  String? ratingsStatistics;
  String? ratingsOverall;
  String? accountStatus;
  dynamic accountReason;
  DateTime? updatedAt;

  bool get isImporterExporter {
    if (userType != UserType.importerExporter.value) return true;
    return false;
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        photoProfile: json["photo_profile"],
        taxNumber: json["tax_number"],
        bio: json["bio"],
        userType: json["user_type"],
        ratingsCount: json["ratings_count"],
        ratingsStatistics: json["ratings_statistics"],
        ratingsOverall: json["ratings_overall"],
        accountStatus: json["account_status"],
        accountReason: json["account_reason"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "email": email,
        "photo_profile": photoProfile,
        "tax_number": taxNumber,
        "bio": bio,
        "user_type": userType,
        "ratings_count": ratingsCount,
        "ratings_statistics": ratingsStatistics,
        "ratings_overall": ratingsOverall,
        "account_status": accountStatus,
        "account_reason": accountReason,
        "updated_at":
            "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
      };
}

enum UserType {
  provider('provider'),
  importerExporter('importer_exporter');

  final String value;
  const UserType(this.value);
}
