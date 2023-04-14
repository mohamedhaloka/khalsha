import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../repo/map_repo.dart';

class GetLocationNameUseCase extends UseCase<String, GetLocationNameParams> {
  final MapRepository mapRepository;
  GetLocationNameUseCase(this.mapRepository);

  @override
  Future<Either<Failure, String>> execute(GetLocationNameParams params) {
    params.loading(true);
    final call = mapRepository.getLocationName(params.lat, params.long);
    call.then((_) => params.loading(false));
    return call;
  }
}

class GetLocationNameParams extends Params {
  final double lat, long;
  GetLocationNameParams({
    required super.loading,
    required this.lat,
    required this.long,
  });
}
