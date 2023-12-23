enum ServiceTypes {
  customsClearance('customsclearance'),
  landShipping('landshippings'),
  stores('warehouses'),
  marineShipping('seashippings'),
  airFreight('airshippings'),
  laboratoryAndStandards('laboratories');

  const ServiceTypes(this.value);
  final String value;
}
