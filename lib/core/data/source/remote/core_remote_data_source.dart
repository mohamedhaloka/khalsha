import 'package:dio/dio.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';

import 'package:khalsha/core/data/models/profile_data_model.dart';

abstract class CoreRemoteDataSource {
  Future<ProfileDataModel> getProfile();



  Future<List<DataModel>> getParticularEnvData(String pageName);

  Future<String> uploadImage({
    required String pageName,
    required String orderId,
    required String path,
    required String field,
    required String filePath,
  });

  Future<String> deleteFile(String pageName, {required int id});

  Future<String> downloadFile(String url);
}

class CoreRemoteDataSourceImpl extends CoreRemoteDataSource {
  final HttpService _httpService;
  CoreRemoteDataSourceImpl(this._httpService);

  @override
  Future<ProfileDataModel> getProfile() async {
    final response = await _httpService.get('auth/user-profile');

    if (response.statusCode == 200) {
      return ProfileDataModel.fromJson(response.data['data']);
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<List<DataModel>> getParticularEnvData(String pageName) async {
    final response = await _httpService.get(pageName);

    if (response.statusCode == 200) {
      final dataList = <DataModel>[];

      for (var item in response.data['data']) {
        dataList.add(DataModel.fromJson(item));
      }

      return dataList;
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<String> uploadImage({
    required String pageName,
    required String orderId,
    required String path,
    required String field,
    required String filePath,
  }) async {
    final formData = FormData.fromMap({
      'dz_attach_param_name': field,
      'dz_id': orderId,
      'dz_path': '$path/$orderId',
    });

    if (filePath.isNotEmpty) {
      formData.files.addAll([
        MapEntry(
          field,
          await MultipartFile.fromFile(filePath),
        ),
      ]);
    }
    final response = await _httpService.post(
      '$pageName/upload/multi',
      formData,
    );

    if (response.statusCode == 200) {
      return 'تم رفع الملف بنجاح';
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<String> deleteFile(String pageName, {required int id}) async {
    final formData = FormData.fromMap({'id': id});
    final response = await _httpService.post('$pageName/delete/file', formData);

    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<String> downloadFile(String url) async {
    final file = await _httpService.download(url);
    if (file.path != '') {
      return file.path;
    } else {
      throw const ServerException();
    }
  }
}
