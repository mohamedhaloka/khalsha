import 'package:dartz/dartz.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/utils/constants.dart';
import 'package:khalsha/features/map/data/data_source/map_remote_data_source.dart';
import 'package:khalsha/features/map/domain/repo/map_repo.dart';
import 'package:location/location.dart';

class MapRepositoryImpl extends MapRepository {
  final MapRemoteDataSource mapRemoteDataSource;
  MapRepositoryImpl(this.mapRemoteDataSource);

  @override
  Future<Either<Failure, LocationData>> getDeviceLocation() async {
    try {
      final locationData = await mapRemoteDataSource.getDeviceLocation();
      return right(locationData);
    } on PermissionLocationException {
      return left(const PermissionLocationFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getLocationName(double lat, double long,
      {String? locality}) async {
    try {
      final locationName = await mapRemoteDataSource.getLocationName(lat, long,
          locality: locality);
      return right(locationName);
    } on NoPlacesFoundException {
      return left(const NoPlacesFoundFailure());
    } on ServiceNotAvailableForThisLocationException catch (e) {
      return left(ServiceNotAvailableForThisLocationFailure(e.placeName));
    }
  }

  @override
  Future<Either<Failure, List<Prediction>>> getPlacesFromSearch(
      String text, String language) async {
    try {
      final result =
          await mapRemoteDataSource.getPlacesFromSearch(text, language);
      return right(result);
    } on ServerException {
      return left(const ServerFailure(errorCode: ServerErrorCode.notFound));
    }
  }

  @override
  Future<Either<Failure, PlacesDetailsResponse>> getPlaceDetails(String placeId,
      {required String language}) async {
    try {
      final result = await mapRemoteDataSource.getPlaceDetails(placeId,
          language: language);
      return right(result);
    } on ServerException {
      return left(const ServerFailure(errorCode: ServerErrorCode.notFound));
    }
  }
}
