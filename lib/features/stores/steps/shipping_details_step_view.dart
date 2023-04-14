part of '../stores.dart';

class ShippingDetailsStepView extends StatelessWidget {
  const ShippingDetailsStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChooseItemWithHolder(
          title: 'المساحة المطلوبة',
          selectedItem: DataModel.empty().obs,
          bottomSheetTitle: 'أختر المساحة المطلوبة',
          height: Get.height / 2,
          body: MultiItemsList(
            items: [],
            selectedItem: DataModel.empty().obs,
          ),
        ),
        ToggleItemWithHolder(
          title: 'نوع التعاقد',
          items: storesOrderSizeOptions,
          selectedItem: 0.obs,
        ),
        InputHolderBox(
          CounterComponent(
            number: 0.obs,
            title: 'مدة التعاقد',
          ),
        ),
        ServiceItemWithHolder(
          title: 'بداية التعاقد',
          bottomSheetTitle: 'أختر تاريخ بداية التعاقد',
          height: Get.height / 1.8,
          body: const CalenderView(),
        ),
      ],
    );
  }
}
