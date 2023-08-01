import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../blog/data/models/category_model.dart';
import '../../data/models/resource_model.dart';

abstract class ResourcesRepository {
  Future<Either<Failure, List<CategoryModel>>> getList();

  Future<Either<Failure, List<ResourceModel>>> getResourceDetails(
    String itemId,
  );
}
