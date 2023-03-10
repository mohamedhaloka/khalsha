import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';
import 'package:khalsha/core/routes/app_routes.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

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
          ),
          ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => _PostItem(controller.posts[index]),
            separatorBuilder: (_, __) => const Divider(height: 30),
            itemCount: controller.posts.length,
          ),
        ],
      ),
    );
  }
}

class _PostItem extends StatelessWidget {
  const _PostItem(this.post, {Key? key}) : super(key: key);
  final ItemModel post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.postDetails),
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
                  Image.asset(
                    'assets/images/dummy/post-${post.image}.jpg',
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
                  'ما لا تعرفه عن',
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: ColorManager.primaryColor,
                  ),
                ),
                Text(
                  post.text,
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'تم النشر 15 يناير ٥ دقائق قرأة',
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
