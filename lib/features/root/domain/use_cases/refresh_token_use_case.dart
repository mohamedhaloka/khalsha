import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/root/domain/repository/root_repository.dart';

class RefreshTokenUseCase extends UseCase<UserData, Params> {
  final RootRepository _rootRepository;
  RefreshTokenUseCase(this._rootRepository);

  @override
  Future<Either<Failure, UserData>> execute(Params params) async {
    params.loading(true);
    final call = _rootRepository.refreshToken();
    call.then((_) => params.loading(false));
    return call;
  }
}
