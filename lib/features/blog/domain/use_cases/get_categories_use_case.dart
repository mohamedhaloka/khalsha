import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';

import '../repo/blog_repository.dart';

class GetCategoriesUseCase extends UseCase<List<CategoryModel>, Params> {
  final BlogRepository _blogRepository;
  GetCategoriesUseCase(this._blogRepository);

  @override
  Future<Either<Failure, List<CategoryModel>>> execute(Params params) async {
    params.loading(true);
    final call = _blogRepository.getCategories();
    call.then((_) => params.loading(false));
    return call;
  }
}
