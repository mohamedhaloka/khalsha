import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/settlement/data/models/settlement.dart';
import 'package:khalsha/features/settlement/domain/repo/settlement_repository.dart';

class GetSettlementsUseCase extends UseCase<List<SettlementModel>, Params> {
  final SettlementRepository _settlementRepository;
  GetSettlementsUseCase(this._settlementRepository);

  @override
  Future<Either<Failure, List<SettlementModel>>> execute(Params params) async {
    params.loading(true);
    final call = _settlementRepository.getSettlements();
    call.then((_) => params.loading(false));
    return call;
  }
}
