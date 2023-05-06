import 'package:dio/dio.dart';

import '../../../../core/data/services/http_service.dart';
import '../../../../core/domain/error/exceptions.dart';

abstract class AccountSettingsRemoteDataSource {
  Future<String> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  });
}

class AccountSettingsRemoteDataSourceImpl
    extends AccountSettingsRemoteDataSource {
  final HttpService _httpService;
  AccountSettingsRemoteDataSourceImpl(this._httpService);

  @override
  Future<String> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    final formData = FormData.fromMap({
      'current_password': currentPassword,
      'password': newPassword,
      'password_confirmation': confirmNewPassword,
    });
    final response = await _httpService.post('auth/change/password', formData);
    if (response.statusCode == 200 && response.data['status']) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }
}
