part of '../../land_shipping.dart';

class _LoadingUnLoadingLocationsInputs
    extends GetView<AddEditLandShippingServiceController> {
  const _LoadingUnLoadingLocationsInputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextUnderline('موقع التحميل والتسليم'),
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => Column(
              children: [
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      TextFieldInputWithHolder(
                    title: 'موقع التحميل/ المدينة',
                    controller: controller.locationsData[index].loadingLocation,
                    enabled: false,
                    onTap: () async {
                      final result = await Get.toNamed(
                        Routes.map,
                        arguments: [
                          controller
                              .locationsData[index].loadingLocationDetails,
                          ServiceTypes.landShipping,
                        ],
                      );
                      if (result == null) return;
                      if (result is LocationDetails) {
                        controller.locationsData[index] =
                            controller.locationsData[index].copyWith(
                          loadingLocationDetails: result,
                          loadingLocation:
                              TextEditingController(text: result.name ?? ''),
                        );
                      }
                    },
                    onSaved: (String? value) => field.didChange(value),
                    errorText: field.errorText,
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: 'input-is-required'.tr),
                  name: '${LandShipmentInputsKeys.loadingLocation.name}_$index',
                ),
                if (controller.isPrivateTransfer)
                  FormBuilderField(
                    builder: (FormFieldState<dynamic> field) =>
                        DropDownInputWithHolder(
                      title: 'وصف موقع التحميل',
                      dropValue: controller.locationsData[index].loading,
                      source: locations
                          .map((e) => DropdownMenuItem(
                                value: e.value,
                                child: Text(e.value.tr),
                              ))
                          .toList(),
                      errorText: field.errorText,
                    ),
                    onSaved: (_) => controller.didFieldChanged(
                      '${LandShipmentInputsKeys.loadingLocationType.name}_$index',
                      value: controller.locationsData[index].loading.value,
                    ),
                    validator: FormBuilderValidators.required(
                        errorText: 'input-is-required'.tr),
                    name:
                        '${LandShipmentInputsKeys.loadingLocationType.name}_$index',
                  ),
                const Divider(),
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      TextFieldInputWithHolder(
                    title: 'موقع التسليم/ المدينة',
                    controller:
                        controller.locationsData[index].unloadingLocation,
                    enabled: false,
                    onTap: () async {
                      //TODO: change this ServiceTypes.airFreight
                      final result = await Get.toNamed(
                        Routes.map,
                        arguments: [
                          controller
                              .locationsData[index].unloadingLocationDetails,
                          ServiceTypes.airFreight,
                        ],
                      );
                      if (result == null) return;
                      if (result is LocationDetails) {
                        controller.locationsData[index] =
                            controller.locationsData[index].copyWith(
                          unloadingLocationDetails: result,
                          unloadingLocation:
                              TextEditingController(text: result.name ?? ''),
                        );
                      }
                    },
                    onSaved: (String? value) => field.didChange(value),
                    errorText: field.errorText,
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: 'input-is-required'.tr),
                  name:
                      '${LandShipmentInputsKeys.unloadingLocation.name}_$index',
                ),
                if (controller.isPrivateTransfer)
                  FormBuilderField(
                    builder: (FormFieldState<dynamic> field) =>
                        DropDownInputWithHolder(
                      title: 'وصف موقع التسليم',
                      dropValue: controller.locationsData[index].unloading,
                      source: locations
                          .map((e) => DropdownMenuItem(
                                value: e.value,
                                child: Text(e.value.tr),
                              ))
                          .toList(),
                      errorText: field.errorText,
                    ),
                    onSaved: (_) => controller.didFieldChanged(
                      '${LandShipmentInputsKeys.unloadingLocationType.name}_$index',
                      value: controller.locationsData[index].unloading.value,
                    ),
                    validator: FormBuilderValidators.required(
                        errorText: 'input-is-required'.tr),
                    name:
                        '${LandShipmentInputsKeys.unloadingLocationType.name}_$index',
                  ),
                if (controller.locationsData.length > 1)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomButton(
                      width: 40,
                      height: 40,
                      onTap: () => controller.locationsData
                          .remove(controller.locationsData[index]),
                      imgName: 'delete',
                      backgroundColor: ColorManager.errorColor,
                    ),
                  ),
              ],
            ),
            separatorBuilder: (_, __) =>
                const Divider(indent: 10, endIndent: 10),
            itemCount: controller.locationsData.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: Divider()),
              Container(
                padding: const EdgeInsets.all(4),
                color: ColorManager.primaryColor,
                child: InkWell(
                    onTap: () => controller.locationsData
                        .add(LoadingUnLoadingLocationsModel.newItem()),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'إضافة موقع أخر',
                          style: Get.textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
              ),
              const Expanded(child: Divider()),
            ],
          ),
        ),
      ],
    );
  }

  List<DeliveryDescTypes> get locations {
    if (controller.shippingType.value == 0) return DeliveryDescTypes.values;
    return [
      DeliveryDescTypes.market,
      DeliveryDescTypes.factory,
      DeliveryDescTypes.warehouse,
      DeliveryDescTypes.groundFloor,
      DeliveryDescTypes.firstFloor,
      DeliveryDescTypes.loft,
      DeliveryDescTypes.other,
    ];
  }
}

enum DeliveryDescTypes {
  groundFloor('ground_floor'),
  firstFloor('first_floor'),
  loft('loft'),
  market('market'),
  warehouse('warehouse'),
  factory('factory'),
  other('other');

  final String value;
  const DeliveryDescTypes(this.value);
}
