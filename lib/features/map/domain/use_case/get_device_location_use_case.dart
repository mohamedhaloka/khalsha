import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/map/domain/repo/map_repo.dart';

class GetDeviceLocationUseCase extends UseCase<LocationData, Params> {
  final MapRepository mapRepository;
  GetDeviceLocationUseCase(this.mapRepository);

  @override
  Future<Either<Failure, LocationData>> execute(Params params) {
    params.loading(true);
    final call = mapRepository.getDeviceLocation();
    call.then((_) => params.loading(false));
    return call;
  }
}
