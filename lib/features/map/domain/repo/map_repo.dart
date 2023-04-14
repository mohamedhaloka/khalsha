import 'package:dartz/dartz.dart';
import 'package:google_maps_webservice/places.dart' as place;
import 'package:location/location.dart';

import '../../../../core/domain/error/failures.dart';

abstract class MapRepository {
  Future<Either<Failure, LocationData>> getDeviceLocation();

  Future<Either<Failure, String>> getLocationName(double lat, double long);

  Future<Either<Failure, List<place.Prediction>>> getPlacesFromSearch(
      String text, String language);

  Future<Either<Failure, place.PlacesDetailsResponse>> getPlaceDetails(
      String placeId,
      {required String language});
}
