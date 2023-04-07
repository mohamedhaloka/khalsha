import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/orders/data/models/order_model.dart';

import '../../../../core/presentation/routes/app_routes.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

const _kAccepted = 'accepted';
const _kRejected = 'rejected';
const _kPending = 'pending';
const _kOpen = 'open';
const _kClose = 'closed';

class OrderItem extends StatelessWidget {
  const OrderItem(this.order, {Key? key}) : super(key: key);
  final OrderModel order;

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
                  _detail(order.customclearance.title),
                  _detail(order.customclearance.user.name),
                  _detail('${order.total} ريال'),
                ],
              ),
            ),
            const Divider(
              color: ColorManager.greyColor,
            ),
            Expanded(
              child: Row(
                children: [
                  _Status(order.customclearance.status),
                  _Status(order.status)
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
  final String statusId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Chip(
        label: Text(
          _statusTxt,
          style: TextStyle(color: _statusTxtColor),
        ),
        backgroundColor: _statusBGColor,
      ),
    );
  }

  Color get _statusBGColor {
    switch (statusId) {
      case _kAccepted:
      case _kOpen:
        return ColorManager.primaryColor;
      case _kRejected:
      case _kClose:
        return ColorManager.darkTobyColor;
      case _kPending:
        return Colors.orange;
      default:
        return ColorManager.skyColor;
    }
  }

  Color get _statusTxtColor {
    switch (statusId) {
      case _kAccepted:
      case _kRejected:
      case _kOpen:
      case _kClose:
        return Colors.white;
      case _kPending:
        return Colors.black;
      default:
        return Colors.blue;
    }
  }

  String get _statusTxt {
    switch (statusId) {
      case _kAccepted:
        return 'تم القبول';
      case _kRejected:
        return 'تم الرفض';
      case _kOpen:
        return 'مفتوح';
      case _kClose:
        return 'مغلق';
      case _kPending:
        return 'بالإنتظار';
      default:
        return '';
    }
  }
}
