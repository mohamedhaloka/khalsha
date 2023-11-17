import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/core/data/models/profile_data_model.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/data/source/remote/core_remote_data_source.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/core_repository.dart';

class CoreRepositoryImpl extends BaseRepositoryImpl implements CoreRepository {
  final CoreRemoteDataSource _coreRemoteDataSource;
  CoreRepositoryImpl(this._coreRemoteDataSource);

  @override
  Future<Either<Failure, ProfileDataModel>> getProfile() async {
    return request(() async {
      final result = await _coreRemoteDataSource.getProfile();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<DataModel>>> getParticularEnvData(
      String pageName) async {
    return request(() async {
      final result = await _coreRemoteDataSource.getParticularEnvData(pageName);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, String>> uploadImage({
    required String pageName,
    required String orderId,
    required String path,
    required String field,
    required String filePath,
  }) async {
    return request(() async {
      final result = await _coreRemoteDataSource.uploadImage(
        pageName: pageName,
        orderId: orderId,
        path: path,
        field: field,
        filePath: filePath,
      );
      return right(result);
    });
  }

  @override
  Future<Either<Failure, String>> deleteFile(String pageName,
      {required int id}) async {
    return request(() async {
      final result = await _coreRemoteDataSource.deleteFile(pageName, id: id);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, String>> downloadFile(String url) async {
    return request(() async {
      final result = await _coreRemoteDataSource.downloadFile(url);
      return right(result);
    });
  }
}
