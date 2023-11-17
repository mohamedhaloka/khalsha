import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/blog/data/data_source/blog_remote_data_source.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';
import 'package:khalsha/features/blog/data/models/post_model.dart';
import 'package:khalsha/features/blog/domain/repo/blog_repository.dart';

class BlogRepositoryImpl extends BaseRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource _blogRemoteDataSource;
  BlogRepositoryImpl(this._blogRemoteDataSource);

  @override
  Future<Either<Failure, List<PostModel>>> blogSearch(String searchText) async {
    return request(() async {
      final result = await _blogRemoteDataSource.blogSearch(searchText);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<PostModel>>> getBlogByCategory(
      String categoryId) async {
    return request(() async {
      final result = await _blogRemoteDataSource.getBlogByCategory(categoryId);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    return request(() async {
      final result = await _blogRemoteDataSource.getCategories();
      return right(result);
    });
  }
}
