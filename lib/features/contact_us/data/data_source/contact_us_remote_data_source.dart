import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';

import '../../../../core/domain/error/exceptions.dart';

abstract class ContactUsRemoteDataSource {
  Future<String> sendMessage({
    required String title,
    required String message,
    required String name,
    required String email,
    required String mobile,
  });
}

class ContactUsRemoteDataSourceImpl extends ContactUsRemoteDataSource {
  final HttpService _httpService;
  ContactUsRemoteDataSourceImpl(this._httpService);

  @override
  Future<String> sendMessage({
    required String title,
    required String message,
    required String name,
    required String email,
    required String mobile,
  }) async {
    final FormData data = FormData.fromMap({
      'title': title,
      'message': message,
      'name': name,
      'email': email,
      'mobile': mobile,
    });
    final response = await _httpService.post('contactus', data);

    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
