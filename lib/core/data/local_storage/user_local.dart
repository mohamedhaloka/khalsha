import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../main.dart';
import '../models/user_data_model.dart';
import 'local.dart';

class UserDataLocal
    implements LocalStorage<Rx<UserData>?, Map<String, dynamic>?> {
  UserDataLocal._();
  static UserDataLocal instance = UserDataLocal._();

  var storage = GetStorage();
  Rx<UserData> data = UserData().obs;
  bool get isLoggedIn => data.value.accessToken != null;
  UserData get guestUser => data.value = UserData();

  String get clientName => data.value.dataOrNull.name ?? '';
  String get token => data.value.accessToken ?? '';

  bool get isImporterExporter {
    if (isLoggedIn) {
      return data.value.dataOrNull.isImporterExporter;
    }
    return provider;
  }

  void setToken(String token) => data.value.accessToken = token;

  Future<void> init() async => get();

  @override
  Rx<UserData>? get() {
    Map<String, dynamic>? userData = storage.read('userData');

    if (userData != null) {
      if (kDebugMode) {
        print(userData);
      }
      data.value = UserData.fromJson(userData);
      return data;
    }

    guestUser;
    return data;
  }

  @override
  void save(Map<String, dynamic>? userData) {
    storage.write('userData', userData);
    if (userData != null) {
      data.value = UserData.fromJson(userData);
    } else {
      guestUser;
    }
  }

  @override
  void remove() {
    guestUser;
    storage.remove('userData');
  }
}
