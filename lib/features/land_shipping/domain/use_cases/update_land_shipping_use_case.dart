import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/land_shipping/domain/repository/land_shipping_repository.dart';

import 'package:khalsha/features/land_shipping/domain/use_cases/add_land_shipping_use_case.dart';

class UpdateLandShippingUseCase
    extends UseCase<Map<String, dynamic>, LandShippingUseCaseParams> {
  final LandShippingRepository _landShippingRepository;
  UpdateLandShippingUseCase(this._landShippingRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      LandShippingUseCaseParams params) {
    params.loading(true);
    final call = _landShippingRepository.updateOrder(params.data);
    call.then((_) => params.loading(false));
    return call;
  }
}
