import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/presentation/extentions/format_time_extention.dart';
import 'package:khalsha/features/blog/data/models/post_model.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../core/presentation/routes/app_routes.dart';
import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

class BlogView extends GetView<BlogController> {
  const BlogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'المدونة'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        children: [
          CustomTextField(
            fillColor: ColorManager.lightGrey2Color,
            borderSide: const BorderSide(color: ColorManager.lightGrey2Color),
            radius: 50,
            contentColor: ColorManager.greyColor,
            hint: 'بحث عن مقال جديد',
            prefixImg: 'search',
            onSubmitted: (value) => controller.blogSearch(value),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Obx(() => SizedBox(
                  height: 50,
                  child: ListView.separated(
                    itemBuilder: (_, int index) => InkWell(
                      onTap: () {
                        int categoryId = controller.categories[index].id!;
                        controller.selectedCategory(categoryId);
                        controller.getPostsByCategoryId(categoryId.toString());
                      },
                      child: Obx(() => Chip(
                            backgroundColor: controller.categories[index].id! ==
                                    controller.selectedCategory.value
                                ? ColorManager.primaryColor
                                : ColorManager.lightGreyColor,
                            label: Text(
                              controller.categories[index].name!,
                              style: TextStyle(
                                color: controller.categories[index].id! ==
                                        controller.selectedCategory.value
                                    ? Colors.white
                                    : null,
                                fontWeight: controller.categories[index].id! ==
                                        controller.selectedCategory.value
                                    ? FontWeight.bold
                                    : null,
                              ),
                            ),
                          )),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemCount: controller.categories.length,
                    scrollDirection: Axis.horizontal,
                  ),
                )),
          ),
          Obx(
            () => controller.getPostsLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, int index) =>
                        _PostItem(controller.posts[index]),
                    separatorBuilder: (_, __) => const Divider(height: 30),
                    itemCount: controller.posts.length,
                  ),
          ),
        ],
      ),
    );
  }
}

class _PostItem extends StatelessWidget {
  const _PostItem(this.post, {Key? key}) : super(key: key);
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.postDetails, arguments: post),
      child: SizedBox(
        height: 120,
        width: Get.width,
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    HttpService.fileBaseURL + post.image!,
                    fit: BoxFit.cover,
                    height: 120,
                    width: Get.width,
                  ),
                  Container(
                    color: ColorManager.primaryColor.withOpacity(.4),
                  )
                ],
              ),
            )),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title ?? '',
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: ColorManager.primaryColor,
                  ),
                ),
                Text(
                  post.content ?? '',
                  maxLines: 3,
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'تم النشر ${post.createdAt!.formatTime('dd/MM/yyyy')}',
                  style: Get.textTheme.bodySmall!.copyWith(
                    color: ColorManager.greyColor,
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
