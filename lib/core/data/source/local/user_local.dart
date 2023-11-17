import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/data/source/local/core_local_data_source.dart';

class UserDataLocal
    implements CoreLocalDataSource<Rx<UserData>?, Map<String, dynamic>?> {
  UserDataLocal._();
  static UserDataLocal instance = UserDataLocal._();

  var storage = GetStorage();
  Rx<UserData> data = UserData().obs;
  bool get isLoggedIn => data.value.accessToken != null;
  UserData get guestUser => data.value = UserData();

  String get clientPhoto => data.value.dataOrNull.photoProfile ?? '';
  String get clientName => data.value.dataOrNull.name ?? '';
  String get token => data.value.accessToken ?? '';

  bool get isImporterExporter {
    return data.value.dataOrNull.isImporterExporter;
  }

  void setToken(String token) => data.value.accessToken = token;

  Future<void> init() async => get();

  @override
  Rx<UserData>? get() {
    Map<String, dynamic>? userData = storage.read('userData');

    if (userData != null) {
      log(userData.toString(), name: 'USER DATA');
      data.value = UserData.fromJson(userData);
      return data;
    }

    guestUser;
    return data;
  }

  @override
  Future<void> save(Map<String, dynamic>? userData) async{
   await storage.write('userData', userData);
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
