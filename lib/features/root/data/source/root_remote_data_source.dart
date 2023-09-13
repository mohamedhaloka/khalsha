import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';

import '../../../../core/data/models/user_data_model.dart';

abstract class RootRemoteDataSource {
  Future<UserData> refreshToken();
  Future<String> updateFCMToken(String fcmToken);
  Future<String> logOut();
}

class RootRemoteDataSourceImpl extends RootRemoteDataSource {
  final HttpService _httpService;
  RootRemoteDataSourceImpl(this._httpService);

  @override
  Future<UserData> refreshToken() async {
    final formData = FormData.fromMap({});
    final response = await _httpService.post('auth/refresh', formData);
    if (response.statusCode == 200) {
      return UserData.fromJson(response.data);
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<String> logOut() async {
    final formData = FormData.fromMap({});
    final response = await _httpService.post('auth/logout', formData);
    if (response.statusCode == 200 && response.data['status']) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<String> updateFCMToken(String fcmToken) async {
    final formData = FormData.fromMap({
      'token': fcmToken,
    });
    final response = await _httpService.post('auth/fcm-token', formData);
    if (response.statusCode == 200 && response.data['status']) {
      return response.data['token'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
