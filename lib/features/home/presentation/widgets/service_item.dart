import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../../core/presentation/routes/app_routes.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem(
    this.service, {
    Key? key,
  }) : super(key: key);
  final ItemModel service;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.serviceIntro,
          arguments: service.arguments,
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          color: ColorManager.primaryColor,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/services/${service.image}.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Text(
                  service.text,
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
