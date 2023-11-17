import 'package:flutter/material.dart';
import 'package:khalsha/core/data/models/item_model.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class ShipmentDetailsSheet extends StatelessWidget {
  const ShipmentDetailsSheet(this.items, {Key? key}) : super(key: key);
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        itemBuilder: (_, int index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          color: (items[index].mainItem ?? false)
              ? ColorManager.secondaryColor
              : null,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  items[index].text,
                  style: TextStyle(
                    color: (items[index].mainItem ?? false)
                        ? Colors.white
                        : ColorManager.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (items[index].description != null)
                Text(
                  items[index].description ?? '',
                  style: TextStyle(
                    color:
                        (items[index].mainItem ?? false) ? Colors.white : null,
                  ),
                ),
            ],
          ),
        ),
        separatorBuilder: (_, __) => const Divider(
          color: ColorManager.greyColor,
        ),
        itemCount: items.length,
      ),
    );
  }
}
