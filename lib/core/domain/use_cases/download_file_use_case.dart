import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/core_repository.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

class DownloadFileUseCase extends UseCase<String, DownloadFileUseCaseParams> {
  final CoreRepository _coreRepository;
  DownloadFileUseCase(this._coreRepository);

  @override
  Future<Either<Failure, String>> execute(
      DownloadFileUseCaseParams params) async {
    params.loading(true);
    final call = _coreRepository.downloadFile(
      params.url,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class DownloadFileUseCaseParams extends Params {
  final String url;
  DownloadFileUseCaseParams({
    required super.loading,
    required this.url,
  });
}
