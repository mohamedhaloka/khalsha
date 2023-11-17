class LocationDetails {
  String? name;
  double lat, long;
  LocationDetails({this.long = 51.250942, this.name, this.lat = 25.345130});

  factory LocationDetails.fromArgs(LocationDetails? locationDetails) =>
      LocationDetails(
        long: locationDetails!.long,
        lat: locationDetails.lat,
        name: locationDetails.name,
      );
}
