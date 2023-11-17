import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/sources/data/models/resource_model.dart';

import 'package:khalsha/features/sources/domain/repo/resources_repository.dart';

class GetResourceDetailsUseCase
    extends UseCase<List<ResourceModel>, GetResourceDetailsUseCaseParams> {
  final ResourcesRepository _sourcesRepository;
  GetResourceDetailsUseCase(this._sourcesRepository);

  @override
  Future<Either<Failure, List<ResourceModel>>> execute(
      GetResourceDetailsUseCaseParams params) async {
    params.loading(true);
    final call = _sourcesRepository.getResourceDetails(params.itemId);
    call.then((_) => params.loading(false));
    return call;
  }
}

class GetResourceDetailsUseCaseParams extends Params {
  final String itemId;

  GetResourceDetailsUseCaseParams({
    required super.loading,
    required this.itemId,
  });
}
