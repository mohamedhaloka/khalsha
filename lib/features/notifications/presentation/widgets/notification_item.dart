import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

import '../../../../core/models/item_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(this.index, this.notification, {Key? key})
      : super(key: key);
  final ItemModel notification;
  final int index;

  bool get isOdd => index.isOdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: isOdd ? Colors.grey[200] : Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          Container(
            width: 2,
            height: 90,
            color: isOdd
                ? ColorManager.darkTobyColor
                : ColorManager.lightTobyColor,
          ),
          const SizedBox(width: 10),
          Expanded(
              child: Row(
            children: [
              SvgPicture.asset('assets/images/icons/support.svg'),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notification.text,
                    style: Get.textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    notification.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.caption!.copyWith(color: Colors.black),
                  )
                ],
              ))
            ],
          ))
        ],
      ),
    );
  }
}
