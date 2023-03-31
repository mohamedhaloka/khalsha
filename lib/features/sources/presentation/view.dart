import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/data/models/item_model.dart';
import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

class SourcesView extends GetView<SourcesController> {
  const SourcesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'المصادر'),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SvgPicture.asset(
            'assets/images/waves.svg',
            fit: BoxFit.fill,
            width: Get.width,
          ),
          GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 40.0,
              mainAxisSpacing: 40.0,
            ),
            itemCount: controller.sources.length,
            itemBuilder: (_, int index) =>
                _SourceItem(controller.sources[index]),
          ),
        ],
      ),
    );
  }
}

class _SourceItem extends StatelessWidget {
  const _SourceItem(this.item, {Key? key}) : super(key: key);
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200]!,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 4),
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child:
                      SvgPicture.asset('assets/images/icons/${item.image}.svg'),
                ),
              )),
          Expanded(
              child: Center(
            child: Text(
              item.text,
              textAlign: TextAlign.center,
              style: Get.textTheme.titleMedium!.copyWith(
                color: ColorManager.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
