import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../../core/presentation/routes/app_routes.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(this.order, {Key? key}) : super(key: key);
  final ItemModel order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.orderDetails),
      child: Container(
        height: 110,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            image: DecorationImage(
              image: ExactAssetImage('assets/images/order-bg.png'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 5),
                blurRadius: 5,
                spreadRadius: .2,
              ),
            ]),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  _detail('نقل أغذية'),
                  _detail('من جدة'),
                  if (Get.currentRoute == Routes.orders) ...[
                    _detail('الميناء الجاف'),
                  ] else ...[
                    _detail('${order.text} ريال'),
                  ],
                ],
              ),
            ),
            const Divider(
              color: ColorManager.greyColor,
            ),
            Expanded(
              child: Row(
                children: [
                  _detail('مواد غذائية'),
                  _detail('من الرياض'),
                  if (Get.currentRoute == Routes.orders) ...[
                    _detail('2300 ريال'),
                  ] else ...[
                    _Status(order.id ?? 0)
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _detail(String text) => Expanded(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Get.textTheme.subtitle1,
        ),
      );
}

class _Status extends StatelessWidget {
  const _Status(this.statusId, {Key? key}) : super(key: key);
  final int statusId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Chip(
      label: Text(
        _statusTxt,
        style: TextStyle(color: _statusTxtColor),
      ),
      backgroundColor: _statusBGColor,
    ));
  }

  Color get _statusBGColor {
    switch (statusId) {
      case 0:
        return ColorManager.primaryColor;
      case 1:
        return ColorManager.darkTobyColor;
      default:
        return ColorManager.skyColor;
    }
  }

  Color get _statusTxtColor {
    switch (statusId) {
      case 0:
      case 1:
        return Colors.white;
      default:
        return Colors.blue;
    }
  }

  String get _statusTxt {
    switch (statusId) {
      case 0:
        return 'تم القبول';
      case 1:
        return 'تم الرفض';
      default:
        return 'قيد الإنتظار';
    }
  }
}
