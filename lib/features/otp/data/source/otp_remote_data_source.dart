import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/features/otp/data/models/enums/verify_type_model.dart';

abstract class OTPRemoteDataSource {
  Future<String> sendCode(VerifyTypeModel verifyTypeModel);
  Future<String> activeCode(VerifyTypeModel verifyTypeModel, String code);
}

class OTPRemoteDataSourceImpl extends OTPRemoteDataSource {
  final HttpService _httpService;
  OTPRemoteDataSourceImpl(this._httpService);

  @override
  Future<String> sendCode(VerifyTypeModel verifyTypeModel) async {
    final formData = FormData.fromMap({});
    String query = verifyTypeModel.name;
    final response =
        await _httpService.post('auth/$query/verify/resend', formData);

    log(response.data.toString());
    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }

  @override
  Future<String> activeCode(
      VerifyTypeModel verifyTypeModel, String code) async {
    final formData = FormData.fromMap({
      'code': code,
    });
    String query = verifyTypeModel.name;
    final response =
        await _httpService.post('auth/$query/verify/code', formData);

    if (response.statusCode == 200) {
      if (response.data['message'] == "تم التحقق من الجوال بنجاح " ||
          response.data['message'] == "تم التحقق من البريد الالكتروني بنجاح") {
        return response.data['message'];
      } else {
        throw ServerException(
          errorMessage: response.data['message'].toString(),
        );
      }
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }
}
