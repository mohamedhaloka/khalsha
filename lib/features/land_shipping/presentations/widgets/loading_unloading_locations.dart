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
                TextFieldInputWithHolder(
                  title: 'موقع التحميل/ المدينة',
                  controller:
                      controller.loadingUnloadingData[index].loadingLocation,
                  enabled: false,
                  onTap: () async {
                    final result = await Get.toNamed(
                      Routes.map,
                      arguments: controller
                          .loadingUnloadingData[index].loadingLocationDetails,
                    );
                    if (result == null) return;
                    if (result is LocationDetails) {
                      controller.loadingUnloadingData[index] =
                          controller.loadingUnloadingData[index].copyWith(
                        loadingLocationDetails: result,
                        loadingLocation:
                            TextEditingController(text: result.name ?? ''),
                      );
                    }
                  },
                ),
                if (controller.goodsType.value == 1)
                  DropDownInputWithHolder(
                    title: 'وصف موقع التحميل',
                    dropValue: controller.loadingUnloadingData[index].loading,
                    source: DeliveryDescTypes.values
                        .map((e) => DropdownMenuItem(
                              value: e.value,
                              child: Text(e.value.tr),
                            ))
                        .toList(),
                  ),
                const Divider(),
                TextFieldInputWithHolder(
                  title: 'موقع التسليم/ المدينة',
                  controller:
                      controller.loadingUnloadingData[index].unloadingLocation,
                  enabled: false,
                  onTap: () async {
                    final result = await Get.toNamed(
                      Routes.map,
                      arguments: controller
                          .loadingUnloadingData[index].unloadingLocationDetails,
                    );
                    if (result == null) return;
                    if (result is LocationDetails) {
                      controller.loadingUnloadingData[index] =
                          controller.loadingUnloadingData[index].copyWith(
                        unloadingLocationDetails: result,
                        unloadingLocation:
                            TextEditingController(text: result.name ?? ''),
                      );
                    }
                  },
                ),
                if (controller.goodsType.value == 1)
                  DropDownInputWithHolder(
                    title: 'وصف موقع التسليم',
                    dropValue: controller.loadingUnloadingData[index].unloading,
                    source: DeliveryDescTypes.values
                        .map((e) => DropdownMenuItem(
                              value: e.value,
                              child: Text(e.value.tr),
                            ))
                        .toList(),
                  ),
                if (controller.loadingUnloadingData.length > 1)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomButton(
                      width: 40,
                      height: 40,
                      onTap: () => controller.loadingUnloadingData
                          .remove(controller.loadingUnloadingData[index]),
                      imgName: 'delete',
                      backgroundColor: ColorManager.errorColor,
                    ),
                  ),
              ],
            ),
            separatorBuilder: (_, __) =>
                const Divider(indent: 10, endIndent: 10),
            itemCount: controller.loadingUnloadingData.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              const Expanded(child: Divider()),
              Container(
                padding: const EdgeInsets.all(4),
                color: ColorManager.primaryColor,
                child: InkWell(
                    onTap: () => controller.loadingUnloadingData
                        .add(LoadingUnLoadingLocationsModel.newItem()),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ),
              const Expanded(child: Divider()),
            ],
          ),
        ),
      ],
    );
  }
}

enum DeliveryDescTypes {
  groundFloor('ground_floor'),
  firstFloor('first_floor'),
  loft('loft'),
  factory('factory'),
  warehouse('warehouse'),
  market('market'),
  other('other');

  final String value;
  const DeliveryDescTypes(this.value);
}
