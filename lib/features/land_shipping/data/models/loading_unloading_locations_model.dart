import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/map/data/model/location_details.dart';

class LoadingUnLoadingLocationsModel {
  final TextEditingController loadingLocation, unloadingLocation;
  final LocationDetails loadingLocationDetails, unloadingLocationDetails;
  final RxString loading, unloading;

  LoadingUnLoadingLocationsModel({
    required this.loadingLocation,
    required this.unloadingLocation,
    required this.loadingLocationDetails,
    required this.unloadingLocationDetails,
    required this.loading,
    required this.unloading,
  });

  factory LoadingUnLoadingLocationsModel.newItem() =>
      LoadingUnLoadingLocationsModel(
        loadingLocation: TextEditingController(),
        unloadingLocation: TextEditingController(),
        loadingLocationDetails: LocationDetails(),
        unloadingLocationDetails: LocationDetails(),
        loading: ''.obs,
        unloading: ''.obs,
      );

  LoadingUnLoadingLocationsModel copyWith({
    TextEditingController? loadingLocation,
    TextEditingController? unloadingLocation,
    LocationDetails? loadingLocationDetails,
    LocationDetails? unloadingLocationDetails,
    RxString? loading,
    RxString? unloading,
  }) =>
      LoadingUnLoadingLocationsModel(
        loadingLocation: loadingLocation ?? this.loadingLocation,
        unloadingLocation: unloadingLocation ?? this.unloadingLocation,
        loadingLocationDetails:
            loadingLocationDetails ?? this.loadingLocationDetails,
        unloadingLocationDetails:
            unloadingLocationDetails ?? this.unloadingLocationDetails,
        loading: loading ?? this.loading,
        unloading: unloading ?? this.unloading,
      );
}
