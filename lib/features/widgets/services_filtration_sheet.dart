import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../../core/data/models/item_model.dart';
import '../../core/inputs_style.dart';
import '../../core/presentation/themes/colors_manager.dart';

class ServicesFiltrationSheet extends StatefulWidget {
  const ServicesFiltrationSheet(
    this.title, {
    Key? key,
    required this.selectedService,
    required this.onDoneTapped,
  }) : super(key: key);
  final String title;
  final RxInt selectedService;
  final void Function() onDoneTapped;

  @override
  State<ServicesFiltrationSheet> createState() =>
      _ServicesFiltrationSheetState();
}

class _ServicesFiltrationSheetState extends State<ServicesFiltrationSheet> {
  List<ItemModel> services = <ItemModel>[
    ItemModel(text: ServiceType.customsClearance.value, id: 0),
    ItemModel(text: ServiceType.stores.value, id: 1),
    ItemModel(text: ServiceType.laboratoryAndStandards.value, id: 2),
    ItemModel(text: ServiceType.landShipping.value, id: 3),
    ItemModel(text: ServiceType.marineShipping.value, id: 4),
    ItemModel(text: ServiceType.airFreight.value, id: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Text(
          widget.title,
          style: Get.textTheme.titleMedium!.copyWith(
            color: ColorManager.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 3,
          ),
          itemCount: services.length,
          itemBuilder: (_, int index) => InkWell(
            onTap: () {
              int id = services[index].id ?? 0;
              widget.selectedService(id);
            },
            child: Obx(() {
              int id = services[index].id ?? 0;
              bool isSelected = widget.selectedService.value == id;
              return Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: isSelected ? ColorManager.primaryColor : null,
                    border: Border.all(color: ColorManager.lightGreyColor)),
                child: Center(
                  child: Text(
                    services[index].text.tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodySmall!.copyWith(
                      color: isSelected ? Colors.white : ColorManager.greyColor,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                height: inputHeight,
                radius: radius,
                onTap: widget.onDoneTapped,
                text: 'تأكيد',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomButton(
                height: inputHeight,
                radius: radius,
                onTap: () => widget.selectedService(0),
                text: 'إزالة',
              ),
            ),
          ],
        )
      ],
    );
  }
}
