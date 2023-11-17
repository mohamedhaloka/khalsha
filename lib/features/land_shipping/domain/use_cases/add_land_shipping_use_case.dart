import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/land_shipping/data/models/land_shipping_data.dart';
import 'package:khalsha/features/land_shipping/domain/repository/land_shipping_repository.dart';

class AddLandShippingUseCase
    extends UseCase<Map<String, dynamic>, LandShippingUseCaseParams> {
  final LandShippingRepository _landShippingRepository;
  AddLandShippingUseCase(this._landShippingRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      LandShippingUseCaseParams params) {
    params.loading(true);
    final call = _landShippingRepository.createOrder(params.data);
    call.then((_) => params.loading(false));
    return call;
  }
}

class LandShippingUseCaseParams extends Params {
  final LandShippingData data;

  LandShippingUseCaseParams({
    required super.loading,
    required this.data,
  });
}
