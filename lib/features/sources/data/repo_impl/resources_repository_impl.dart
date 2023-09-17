import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';
import 'package:khalsha/features/sources/data/data_source/resources_remote_data_source.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../domain/repo/resources_repository.dart';
import '../models/resource_model.dart';

class ResourcesRepositoryImpl extends ResourcesRepository {
  final ResourcesRemoteDataSource _sourcesRemoteDataSource;
  ResourcesRepositoryImpl(this._sourcesRemoteDataSource);

  @override
  Future<Either<Failure, List<ResourceModel>>> getResourceDetails(
      String itemId) async {
    try {
      final result = await _sourcesRemoteDataSource.getResourceDetails(itemId);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getList() async {
    try {
      final result = await _sourcesRemoteDataSource.getList();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
