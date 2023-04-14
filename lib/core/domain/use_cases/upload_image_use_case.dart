import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/core_repository.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

class UploadImageUseCase extends UseCase<String, UploadImageUseCaseParams> {
  final CoreRepository _coreRepository;
  UploadImageUseCase(this._coreRepository);

  @override
  Future<Either<Failure, String>> execute(
      UploadImageUseCaseParams params) async {
    params.loading(true);
    final call = _coreRepository.uploadImage(
      pageName: params.pageName,
      orderId: params.orderId,
      path: params.path,
      field: params.field,
      filePath: params.filePath,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class UploadImageUseCaseParams extends Params {
  final String pageName, orderId, path, field, filePath;
  UploadImageUseCaseParams({
    required super.loading,
    required this.pageName,
    required this.path,
    required this.orderId,
    required this.field,
    required this.filePath,
  });
}
