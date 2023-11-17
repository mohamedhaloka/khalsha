import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/root/domain/repository/root_repository.dart';

class LogOutUseCase extends UseCase<String, Params> {
  final RootRepository _rootRepository;
  LogOutUseCase(this._rootRepository);

  @override
  Future<Either<Failure, String>> execute(Params params) async {
    params.loading(true);
    final call = _rootRepository.logOut();
    call.then((_) => params.loading(false));
    return call;
  }
}
