import 'dart:developer';

import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_webservice/places.dart' as place;
import 'package:location/location.dart';

import '../../../../core/domain/error/exceptions.dart';

abstract class MapRemoteDataSource {
  Future<LocationData> getDeviceLocation();

  Future<String> getLocationName(double lat, double lng);

  Future<List<place.Prediction>> getPlacesFromSearch(
    String text,
    String language,
  );

  Future<place.PlacesDetailsResponse> getPlaceDetails(String placeId,
      {String language});
}

class MapRemoteDataSourceImpl extends MapRemoteDataSource {
  final Location location;
  final place.GoogleMapsPlaces googleMapsPlaces;
  MapRemoteDataSourceImpl(
    this.location,
    this.googleMapsPlaces,
  );

  @override
  Future<LocationData> getDeviceLocation() async {
    PermissionStatus permissionStatus = await location.requestPermission();
    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.deniedForever) {
      throw const PermissionLocationException();
    }
    final locationData = await location.getLocation();
    return locationData;
  }

  @override
  Future<String> getLocationName(double lat, double lng) async {
    final places = await geocoding.placemarkFromCoordinates(lat, lng);
    if (places.isEmpty) {
      throw const NoPlacesFoundException();
    } else {
      geocoding.Placemark place = places.first;
      String? street = place.name;
      String? locality =
          street!.contains(place.locality!) ? "" : place.locality;

      return " $street, $locality";
    }
  }

  @override
  Future<List<place.Prediction>> getPlacesFromSearch(
      String text, String language) async {
    final result = await googleMapsPlaces.autocomplete(
      text,
      language: language,
    );

    if (result.status == 'OK') {
      return result.predictions;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<place.PlacesDetailsResponse> getPlaceDetails(
    String placeId, {
    String? language,
  }) async {
    log('place id $placeId');
    final result = await googleMapsPlaces.getDetailsByPlaceId(
      placeId,
      language: language,
    );
    if (result.status == 'OK') {
      return result;
    } else {
      throw const ServerException();
    }
  }
}
