import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/core/data/models/profile_data_model.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/core_repository.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';

import '../source/remote/core_remote_data_source.dart';

class CoreRepositoryImpl extends CoreRepository {
  final CoreRemoteDataSource _coreRemoteDataSource;
  CoreRepositoryImpl(this._coreRemoteDataSource);

  @override
  Future<Either<Failure, ProfileDataModel>> getProfile() async {
    try {
      final result = await _coreRemoteDataSource.getProfile();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfile(String name, String email,
      String mobile, String bio, String commercialCertificate) async {
    try {
      final result = await _coreRemoteDataSource.updateProfile(
        name,
        email,
        mobile,
        bio,
        commercialCertificate,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfilePhoto(String photoPath) async {
    try {
      final result = await _coreRemoteDataSource.updateProfilePhoto(
        photoPath,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, List<DataModel>>> getParticularEnvData(
      String pageName) async {
    try {
      final result = await _coreRemoteDataSource.getParticularEnvData(pageName);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage({
    required String pageName,
    required String orderId,
    required String path,
    required String field,
    required String filePath,
  }) async {
    try {
      final result = await _coreRemoteDataSource.uploadImage(
        pageName: pageName,
        orderId: orderId,
        path: path,
        field: field,
        filePath: filePath,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFile(String pageName,
      {required int id}) async {
    try {
      final result = await _coreRemoteDataSource.deleteFile(pageName, id: id);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, String>> downloadFile(String url) async {
    try {
      final result = await _coreRemoteDataSource.downloadFile(url);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
