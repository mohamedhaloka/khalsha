import 'package:dio/dio.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';

import '../../models/profile_data_model.dart';

abstract class CoreRemoteDataSource {
  Future<ProfileDataModel> getProfile();

  Future<String> updateProfile(
    String name,
    String email,
    String mobile,
    String bio,
    String commercialCertificate,
  );

  Future<String> updateProfilePhoto(String photoPath);

  Future<List<DataModel>> getParticularEnvData(String pageName);
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
      throw ServerException(errorMessage: response.data.toString());
    }
  }

  @override
  Future<String> updateProfile(String name, String email, String mobile,
      String bio, String commercialCertificate) async {
    final formData = FormData.fromMap({
      'name': name,
      'email': email,
      'mobile': mobile,
      'bio': bio,
    });

    if (commercialCertificate.isNotEmpty) {
      formData.files.addAll([
        MapEntry(
          "commercial_cert",
          await MultipartFile.fromFile(commercialCertificate),
        ),
      ]);
    }
    final response = await _httpService.post('auth/update/profile', formData);

    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }

  @override
  Future<String> updateProfilePhoto(String photoPath) async {
    final formData = FormData.fromMap({});

    formData.files.addAll([
      MapEntry(
        "photo_profile",
        await MultipartFile.fromFile(photoPath),
      ),
    ]);
    final response = await _httpService.post('auth/update/photo', formData);

    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data.toString());
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
      throw ServerException(errorMessage: response.data.toString());
    }
  }
}
