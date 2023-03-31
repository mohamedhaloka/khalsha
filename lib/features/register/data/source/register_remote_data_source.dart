import 'package:dio/dio.dart';

import '../../../../core/data/models/user_data_model.dart';
import '../../../../core/data/services/http_service.dart';
import '../../../../core/domain/error/exceptions.dart';

abstract class RegisterRemoteDataSource {
  Future<UserData> register(
    String name,
    String email,
    String password,
    String confirmationPassword,
    String mobile,
    String userType,
    String commercialCertificate,
  );
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final HttpService _httpService;
  RegisterRemoteDataSourceImpl(this._httpService);

  @override
  Future<UserData> register(
    String name,
    String email,
    String password,
    String confirmationPassword,
    String mobile,
    String userType,
    String commercialCertificate,
  ) async {
    final formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmationPassword,
      'mobile': mobile,
      'user_type': userType,
    });

    if (commercialCertificate.isNotEmpty) {
      formData.files.addAll([
        MapEntry(
          "commercial_cert",
          await MultipartFile.fromFile(commercialCertificate),
        ),
      ]);
    }

    final response = await _httpService.post('auth/register', formData);

    if (response.statusCode == 201) {
      return UserData.fromJson(response.data['data']['original']);
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }
}
