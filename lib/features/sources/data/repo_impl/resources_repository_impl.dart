import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';
import 'package:khalsha/features/sources/data/data_source/resources_remote_data_source.dart';
import 'package:khalsha/features/sources/data/models/resource_model.dart';
import 'package:khalsha/features/sources/domain/repo/resources_repository.dart';

class ResourcesRepositoryImpl extends BaseRepositoryImpl
    implements ResourcesRepository {
  final ResourcesRemoteDataSource _sourcesRemoteDataSource;
  ResourcesRepositoryImpl(this._sourcesRemoteDataSource);

  @override
  Future<Either<Failure, List<ResourceModel>>> getResourceDetails(
      String itemId) async {
    return request(() async {
      final result = await _sourcesRemoteDataSource.getResourceDetails(itemId);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getList() async {
    return request(() async {
      final result = await _sourcesRemoteDataSource.getList();
      return right(result);
    });
  }
}
