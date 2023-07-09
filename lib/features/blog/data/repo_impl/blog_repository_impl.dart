import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/blog/data/data_source/blog_remote_data_source.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';
import 'package:khalsha/features/blog/data/models/post_model.dart';
import 'package:khalsha/features/blog/domain/repo/blog_repository.dart';

import '../../../../core/domain/error/exceptions.dart';

class BlogRepositoryImpl extends BlogRepository {
  final BlogRemoteDataSource _blogRemoteDataSource;
  BlogRepositoryImpl(this._blogRemoteDataSource);

  @override
  Future<Either<Failure, List<PostModel>>> blogSearch(String searchText) async {
    try {
      final result = await _blogRemoteDataSource.blogSearch(searchText);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: json.encode(e.response!.data)));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getBlogByCategory(
      String categoryId) async {
    try {
      final result = await _blogRemoteDataSource.getBlogByCategory(categoryId);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: json.encode(e.response!.data)));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final result = await _blogRemoteDataSource.getCategories();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: json.encode(e.response!.data)));
    }
  }
}
