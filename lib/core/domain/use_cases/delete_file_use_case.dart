import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/core_repository.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

class DeleteFileUseCase extends UseCase<String, DeleteFileUseCaseParams> {
  final CoreRepository _coreRepository;
  DeleteFileUseCase(this._coreRepository);

  @override
  Future<Either<Failure, String>> execute(
      DeleteFileUseCaseParams params) async {
    params.loading(true);
    final call = _coreRepository.deleteFile(
      params.pageName,
      id: params.id,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class DeleteFileUseCaseParams extends Params {
  final String pageName;
  final int id;
  DeleteFileUseCaseParams({
    required super.loading,
    required this.pageName,
    required this.id,
  });
}
