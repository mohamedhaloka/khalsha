import 'package:dartz/dartz.dart';
import 'package:google_maps_webservice/places.dart' as place;

import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/map/domain/repo/map_repo.dart';

class GetPlaceDetailsUseCase
    extends UseCase<place.PlacesDetailsResponse, GetPlaceDetailsParams> {
  final MapRepository mapRepository;
  GetPlaceDetailsUseCase(this.mapRepository);

  @override
  Future<Either<Failure, place.PlacesDetailsResponse>> execute(
      GetPlaceDetailsParams params) {
    params.loading(true);
    final call = mapRepository.getPlaceDetails(
      params.placeId,
      language: params.language,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class GetPlaceDetailsParams extends Params {
  final String placeId, language;
  GetPlaceDetailsParams({
    required super.loading,
    required this.placeId,
    required this.language,
  });
}
