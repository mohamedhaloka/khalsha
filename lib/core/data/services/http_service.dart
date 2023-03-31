import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/features/otp/domain/entites/enums/verify_type.dart';
import 'package:khalsha/features/otp/presentation/get/controllers/controller.dart';

import '../local_storage/lang_locale.dart';
import '../local_storage/user_local.dart';

class HttpService extends GetxService {
  HttpService(Dio dio) {
    _dio = dio;
    _dio.options.baseUrl = baseURL;
  }

  static const baseURL = 'https://khalshaa.asdevsop.com/api/';

  late Dio _dio;

  Future<dio.Response> post(String endPoint, dio.FormData data) async {
    log(baseURL + endPoint, name: 'URL');
    log(data.fields.toString(), name: 'BODY');

    var response = await _dio.post(
      baseURL + endPoint,
      data: data,
      options: Options(headers: _header),
    );
    return response;
  }

  Future<dio.Response> get(endPoint) async {
    log('URL ${baseURL + endPoint}');

    var response = await _dio.get(
      baseURL + endPoint,
      options: Options(headers: _header),
    );

    if (response.data['type'] == 'need_verify_email') {
      final userData = UserDataLocal.instance.data.value.toJson();
      Get.offAllNamed(
        Routes.otp,
        arguments: {
          kUserData: userData,
          kVerifyType: VerifyType.email,
        },
      );
    }
    return response;
  }

  Map<String, String> get _header => {
        'Authorization': 'Bearer ${UserDataLocal.instance.token}',
        'lang': Lang.instance.langCode,
        'Accept': 'application/json',
      };
}
