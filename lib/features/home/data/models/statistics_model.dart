class StatisticsModel {
  StatisticsModel({
    this.warehouse,
    this.laboratory,
    this.seaShipping,
    this.airShipping,
    this.landShipping,
    this.customClearance,
  });

  ServiceStatisticModel? warehouse;
  ServiceStatisticModel? laboratory;
  ServiceStatisticModel? seaShipping;
  ServiceStatisticModel? airShipping;
  ServiceStatisticModel? landShipping;
  ServiceStatisticModel? customClearance;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      StatisticsModel(
        warehouse: ServiceStatisticModel.fromJson(json['Warehouse']),
        laboratory: ServiceStatisticModel.fromJson(json['Laboratory']),
        seaShipping: ServiceStatisticModel.fromJson(json['SeaShipping']),
        airShipping: ServiceStatisticModel.fromJson(json['AirShipping']),
        landShipping: ServiceStatisticModel.fromJson(json['LandShipping']),
        customClearance:
            ServiceStatisticModel.fromJson(json['CustomClearance']),
      );

  Map<String, dynamic> toJson() => {
        'Warehouse': warehouse?.toJson(),
        'Laboratory': laboratory?.toJson(),
        'SeaShipping': seaShipping?.toJson(),
        'AirShipping': airShipping?.toJson(),
        'LandShipping': landShipping?.toJson(),
        'CustomClearance': customClearance?.toJson(),
      };
}

class ServiceStatisticModel {
  ServiceStatisticModel({
    required this.all,
    required this.closed,
    required this.open,
    required this.pending,
    required this.offers,
    required this.invoices,
  });

  int all;
  int closed;
  int open;
  int pending;
  int offers;
  int invoices;

  factory ServiceStatisticModel.fromJson(Map<String, dynamic> json) =>
      ServiceStatisticModel(
        all: json['all'],
        closed: json['closed'],
        open: json['open'],
        pending: json['pending'],
        offers: json['offers'],
        invoices: json['invoices'],
      );

  Map<String, dynamic> toJson() => {
        'all': all,
        'closed': closed,
        'open': open,
        'pending': pending,
        'offers': offers,
        'invoices': invoices,
      };
}
