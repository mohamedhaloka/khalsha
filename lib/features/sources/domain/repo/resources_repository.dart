import 'package:dartz/dartz.dart';

import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';
import 'package:khalsha/features/sources/data/models/resource_model.dart';

abstract class ResourcesRepository {
  Future<Either<Failure, List<CategoryModel>>> getList();

  Future<Either<Failure, List<ResourceModel>>> getResourceDetails(
    String itemId,
  );
}
