import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/home/data/models/statistics_model.dart';
import 'package:khalsha/features/home/domain/repository/home_repository.dart';

class GetStatisticsUseCase extends UseCase<StatisticsModel, Params> {
  final HomeRepository _homeRepository;
  GetStatisticsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, StatisticsModel>> execute(Params params) async {
    final call = _homeRepository.getStatistics();
    call.then((_) => params.loading(false));
    return call;
  }
}
