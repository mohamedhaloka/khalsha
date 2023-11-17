import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/home/data/data_source/home_remote_data_source.dart';
import 'package:khalsha/features/home/data/models/statistics_model.dart';
import 'package:khalsha/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends BaseRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, StatisticsModel>> getStatistics() async {
    return request(() async {
      final result = await _homeRemoteDataSource.getStatistics();
      return right(result);
    });
  }
}
