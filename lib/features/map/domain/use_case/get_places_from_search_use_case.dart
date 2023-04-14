import 'package:dartz/dartz.dart';
import 'package:google_maps_webservice/places.dart' as place;

import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../repo/map_repo.dart';

class GetPlacesFromSearchUseCase
    extends UseCase<List<place.Prediction>, GetPlacesFromSearchParams> {
  final MapRepository mapRepository;
  GetPlacesFromSearchUseCase(this.mapRepository);

  @override
  Future<Either<Failure, List<place.Prediction>>> execute(
      GetPlacesFromSearchParams params) {
    params.loading(true);
    final call =
        mapRepository.getPlacesFromSearch(params.search, params.language);
    call.then((_) => params.loading(false));
    return call;
  }
}

class GetPlacesFromSearchParams extends Params {
  final String search, language;
  GetPlacesFromSearchParams({
    required super.loading,
    required this.search,
    required this.language,
  });
}
