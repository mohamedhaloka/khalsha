import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/root/domain/repository/root_repository.dart';

class UpdateFCMTokenUseCase
    extends UseCase<String, UpdateFCMTokenUseCaseParams> {
  final RootRepository _rootRepository;
  UpdateFCMTokenUseCase(this._rootRepository);

  @override
  Future<Either<Failure, String>> execute(
      UpdateFCMTokenUseCaseParams params) async {
    params.loading(true);
    final call = _rootRepository.updateFCMToken(params.fcmToken);
    call.then((_) => params.loading(false));
    return call;
  }
}

class UpdateFCMTokenUseCaseParams extends Params {
  final String fcmToken;

  UpdateFCMTokenUseCaseParams({
    required super.loading,
    required this.fcmToken,
  });
}
