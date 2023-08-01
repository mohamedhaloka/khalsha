import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';
import 'package:khalsha/features/sources/domain/repo/resources_repository.dart';

class GetResourcesUseCase extends UseCase<List<CategoryModel>, Params> {
  final ResourcesRepository _sourcesRepository;
  GetResourcesUseCase(this._sourcesRepository);

  @override
  Future<Either<Failure, List<CategoryModel>>> execute(Params params) async {
    params.loading(true);
    final call = _sourcesRepository.getList();
    call.then((_) => params.loading(false));
    return call;
  }
}
