import 'package:dartz/dartz.dart';
import 'package:khalsha/features/blog/data/models/post_model.dart';

import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';

abstract class BlogRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories();

  Future<Either<Failure, List<PostModel>>> getBlogByCategory(String categoryId);

  Future<Either<Failure, List<PostModel>>> blogSearch(String searchText);
}
