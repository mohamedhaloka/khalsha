// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

import 'package:khalsha/core/data/models/profile_data_model.dart';

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
  ProfileDataModel? user;

  ProfileDataModel get dataOrNull {
    if (user == null) {
      return ProfileDataModel();
    }
    return user!;
  }

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        expiresIn: json['expires_in'],
        user: ProfileDataModel.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'token_type': tokenType,
        'expires_in': expiresIn,
        'user': user!.toJson(),
      };
}

enum UserType {
  provider('provider'),
  importerExporter('importer_exporter');

  final String value;
  const UserType(this.value);
}
