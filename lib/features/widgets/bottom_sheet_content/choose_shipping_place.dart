import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/inputs/text_field_input_with_holder.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/data/models/data_model.dart';
import '../../../core/inputs_style.dart';
import '../../../core/presentation/routes/app_routes.dart';
import '../../map/data/model/location_details.dart';
import '../custom_button.dart';
import '../inputs/drop_down_input_with_holder.dart';

class ChooseShippingPlace extends StatelessWidget {
  ChooseShippingPlace({
    Key? key,
    required this.countries,
    required this.city,
    required this.cityLocationDetails,
    required this.selectedCountry,
    required this.shipmentLocation,
    required this.otherLocation,
    this.forSeaShipment = true,
  }) : super(key: key);
  final bool forSeaShipment;
  final RxString shipmentLocation;
  final RxString selectedCountry;
  final List<DataModel> countries;
  final TextEditingController city, otherLocation;
  LocationDetails cityLocationDetails;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const Divider(
              color: ColorManager.greyColor,
            ),
            DropDownInputWithHolder(
              title: 'مكان الشحن',
              dropValue: shipmentLocation,
              source: forSeaShipment
                  ? MarinePlacesOfShipment.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.value,
                          child: Text(e.value.tr),
                        ),
                      )
                      .toList()
                  : AirPlacesOfShipment.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.value,
                          child: Text(e.value.tr),
                        ),
                      )
                      .toList(),
            ),
            if (shipmentLocation.value ==
                MarinePlacesOfShipment.other.value) ...[
              const Divider(
                color: ColorManager.greyColor,
              ),
              TextFieldInputWithHolder(
                title: 'مكان الشحنة الأخري',
                controller: otherLocation,
              ),
            ],
            const Divider(
              color: ColorManager.greyColor,
            ),
            DropDownInputWithHolder(
              title: 'الدولة',
              dropValue: selectedCountry,
              source: countries
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.id.toString(),
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
            ),
            const Divider(
              color: ColorManager.greyColor,
            ),
            TextFieldInputWithHolder(
              title: 'المدينة',
              controller: city,
              onTap: chooseLocation,
              enabled: false,
            ),
            const Divider(
              color: ColorManager.greyColor,
            ),
            Center(
              child: CustomButton(
                height: inputHeight,
                width: 100,
                radius: radius,
                text: 'تأكيد',
                onTap: () {
                  bool hasEmptyInputs = false;

                  if (shipmentLocation.value == '' ||
                      (shipmentLocation.value ==
                              MarinePlacesOfShipment.other.value
                          ? otherLocation.text.isEmpty
                          : false) ||
                      selectedCountry.value == '' ||
                      city.text.isEmpty) {
                    hasEmptyInputs = true;
                  }

                  Get.back(result: hasEmptyInputs);
                },
              ),
            )
          ],
        ));
  }

  void chooseLocation() async {
    final result =
        await Get.toNamed(Routes.map, arguments: cityLocationDetails);
    if (result == null) return;
    if (result is LocationDetails) {
      cityLocationDetails = result;
      city.text = result.name ?? '';
    }
  }
}

enum MarinePlacesOfShipment {
  port('port'),
  factory('factory'),
  storeHouse('storehouse'),
  workSite('work_site'),
  other('other');

  final String value;
  const MarinePlacesOfShipment(this.value);
}

enum AirPlacesOfShipment {
  airport('airport'),
  factory('factory'),
  storeHouse('storehouse'),
  workSite('work_site'),
  other('other');

  final String value;
  const AirPlacesOfShipment(this.value);
}
