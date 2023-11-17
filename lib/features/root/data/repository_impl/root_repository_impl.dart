import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/root/data/source/root_remote_data_source.dart';
import 'package:khalsha/features/root/domain/repository/root_repository.dart';

class RootRepositoryImpl extends BaseRepositoryImpl implements RootRepository {
  final RootRemoteDataSource _rootRemoteDataSource;
  RootRepositoryImpl(this._rootRemoteDataSource);

  @override
  Future<Either<Failure, UserData>> refreshToken() async {
    return request(() async {
      final result = await _rootRemoteDataSource.refreshToken();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, String>> logOut() async {
    return request(() async {
      final result = await _rootRemoteDataSource.logOut();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, String>> updateFCMToken(String fcmToken) async {
    return request(() async {
      final result = await _rootRemoteDataSource.updateFCMToken(fcmToken);
      return right(result);
    });
  }
}
