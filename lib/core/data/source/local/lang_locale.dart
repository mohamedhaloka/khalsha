import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core_local_data_source.dart';

class Lang extends CoreLocalDataSource<Locale, String> {
  Lang._();

  static Lang instance = Lang._();

  var storage = GetStorage();

  bool get isEn => Get.locale == const Locale('en');
  String get langCode => Get.locale?.languageCode ?? 'en';

  @override
  void save(String data) => storage.write('app_lang', data);

  @override
  Locale get() {
    String? locale = storage.read('app_lang');
    return Locale(locale ?? 'en');
  }

  @override
  void remove() {
    storage.remove('app_lang');
  }

  void change() {
    String lang = isEn ? 'ar' : 'en';
    Get.updateLocale(Locale(lang));
    save(lang);
  }
}
