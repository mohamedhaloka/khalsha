import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<String> forgetPassword(String account);
}

class ForgetPasswordRemoteDataSourceImpl
    extends ForgetPasswordRemoteDataSource {
  final HttpService _httpService;
  ForgetPasswordRemoteDataSourceImpl(this._httpService);

  @override
  Future<String> forgetPassword(String account) async {
    final formData = FormData.fromMap({
      'account': account,
    });
    final response = await _httpService.post('auth/forget/password', formData);

    log(response.data.toString());
    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }
}
