import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<String> resetPassword(
    String account,
    String code,
    String password,
    String confirmationPassword,
  );
}

class ResetPasswordRemoteDataSourceImpl extends ResetPasswordRemoteDataSource {
  final HttpService _httpService;
  ResetPasswordRemoteDataSourceImpl(this._httpService);

  @override
  Future<String> resetPassword(
    String account,
    String code,
    String password,
    String confirmationPassword,
  ) async {
    final formData = FormData.fromMap({
      'account': account,
      'code': code,
      'password': password,
      'password_confirmation': confirmationPassword,
    });
    final response = await _httpService.post('auth/reset/password', formData);

    if (response.statusCode == 200) {
      if (response.data['message'] ==
          'تم استرجاع الحساب بنجاح من فضلك قم بالدخول بكلمة المرور الجديدة') {
        return response.data['message'];
      } else {
        throw ServerException(
          errorMessage: response.data['message'].toString(),
        );
      }
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
