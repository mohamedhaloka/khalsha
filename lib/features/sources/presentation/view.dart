import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';
import 'package:khalsha/features/widgets/cached_image.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

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
          Obx(
            () => controller.getCategoriesLoading.value
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40.0,
                      mainAxisSpacing: 40.0,
                    ),
                    itemCount: controller.categories.length,
                    itemBuilder: (_, int index) =>
                        _SourceItem(controller.categories[index]),
                  ),
          ),
        ],
      ),
    );
  }
}

class _SourceItem extends GetView<SourcesController> {
  const _SourceItem(this.item, {Key? key}) : super(key: key);
  final CategoryModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        controller.getResourcesByCategoryId(item.id.toString());
        Get.bottomSheet(HeadLineBottomSheet(
          bottomSheetTitle: item.name ?? '',
          body: Obx(() => controller.getResourcesLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      if (controller.resources[index].contentImage == null) {
                        return;
                      }
                      Get.dialog(AlertDialog(
                        content: CachedImage(
                          width: 200,
                          height: 200,
                          imgUrl: HttpService.fileBaseURL +
                              controller.resources[index].contentImage!,
                        ),
                      ));
                    },
                    title: Text(controller.resources[index].title ?? ''),
                    leading: CachedImage(
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                      imgUrl: HttpService.fileBaseURL +
                          controller.resources[index].image!,
                    ),
                  ),
                  itemCount: controller.resources.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(indent: 30, endIndent: 30),
                )),
        ));
      },
      child: Container(
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
            // Expanded(
            //     flex: 2,
            //     child: Center(
            //       child: Container(
            //         width: 80,
            //         height: 80,
            //         padding: const EdgeInsets.all(16),
            //         decoration: const BoxDecoration(
            //           color: ColorManager.primaryColor,
            //           borderRadius: BorderRadius.all(Radius.circular(6)),
            //         ),
            //         child:
            //             SvgPicture.asset('assets/images/icons/${item.}.svg'),
            //       ),
            //     ),
            //   ),
            Expanded(
              child: Center(
                child: Text(
                  item.name ?? '',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: ColorManager.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
