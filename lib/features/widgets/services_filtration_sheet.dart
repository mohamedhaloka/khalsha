import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/inputs_style.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../../core/data/models/item_model.dart';
import '../../core/presentation/themes/colors_manager.dart';

class ServicesFiltrationSheet extends StatefulWidget {
  const ServicesFiltrationSheet(
    this.title, {
    Key? key,
    required this.selectedServices,
  }) : super(key: key);
  final String title;
  final RxList<int> selectedServices;

  @override
  State<ServicesFiltrationSheet> createState() =>
      _ServicesFiltrationSheetState();
}

class _ServicesFiltrationSheetState extends State<ServicesFiltrationSheet> {
  List<ItemModel> services = const <ItemModel>[
    ItemModel(text: 'الشحن البري', id: 0),
    ItemModel(text: 'الشحن البحري', id: 1),
    ItemModel(text: 'الشحن الجوي', id: 2),
    ItemModel(text: 'التخليص الجمركي', id: 3),
    ItemModel(text: 'المخازن و المستودعات', id: 4),
    ItemModel(text: 'المختبرات و المقاييس', id: 5),
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
              if (widget.selectedServices.contains(id)) {
                widget.selectedServices.remove(id);
                return;
              }
              widget.selectedServices.add(id);
            },
            child: Obx(() {
              int id = services[index].id ?? 0;
              bool isSelected = widget.selectedServices.contains(id);
              return Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: isSelected ? ColorManager.primaryColor : null,
                    border: Border.all(color: ColorManager.lightGreyColor)),
                child: Center(
                  child: Text(
                    services[index].text,
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
                onTap: Get.back,
                text: 'تأكيد',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomButton(
                height: inputHeight,
                radius: radius,
                onTap: widget.selectedServices.clear,
                text: 'إزالة',
              ),
            ),
          ],
        )
      ],
    );
  }
}
