import 'package:dio/dio.dart';

import '../../../../core/data/services/http_service.dart';
import '../../../../core/domain/error/exceptions.dart';

abstract class AccountSettingsRemoteDataSource {
  Future<String> uploadProfilePhoto({required String imagePath});

  Future<String> updateAccount({
    required String name,
    required String email,
    required String mobile,
    required String commercialCert,
    required String bio,
  });

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
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<String> updateAccount({
    required String name,
    required String email,
    required String mobile,
    required String commercialCert,
    required String bio,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      'email': email,
      'mobile': mobile,
      'bio': bio,
    });

    if (commercialCert.isNotEmpty) {
      formData.files.add(MapEntry(
        'commercial_cert',
        await MultipartFile.fromFile(commercialCert),
      ));
    }

    final response = await _httpService.post('auth/update/profile', formData);
    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<String> uploadProfilePhoto({required String imagePath}) async {
    final formData = FormData.fromMap({});

    formData.files.add(MapEntry(
      'photo_profile',
      await MultipartFile.fromFile(imagePath),
    ));

    final response = await _httpService.post('auth/upload/photo', formData);
    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
