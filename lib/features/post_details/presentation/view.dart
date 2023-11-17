import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/features/widgets/cached_image.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/back_icon.dart';
import 'package:khalsha/features/widgets/sliver_body.dart';
import 'package:khalsha/features/post_details/presentation/get/controllers/controller.dart';

class PostDetailsView extends GetView<PostDetailsController> {
  const PostDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.of(context).viewPadding.top;
    return SliverBody(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      flexibleSpace: Stack(
        alignment: Alignment.center,
        children: [
          CachedImage(
            imgUrl: HttpService.fileBaseURL + controller.post.image!,
            fit: BoxFit.cover,
            width: Get.width,
          ),
          Container(
            color: ColorManager.primaryColor.withOpacity(.1),
          ),
          Positioned(
            top: statusBar + 20,
            left: 20,
            child: const BackIconButton(),
          )
        ],
      ),
      toolbarHeight: 0,
      padding: EdgeInsets.zero,
      collapsedHeight: 0,
      expandedHeight: 300,
      child: SliverList(
        delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Text(
                  controller.post.title ?? '',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleLarge!.copyWith(
                    color: ColorManager.secondaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Divider(
                  height: 40,
                  color: ColorManager.greyColor,
                ),
                Html(
                  data: controller.post.content ?? '',
                  style: {
                    '#': Style(
                      lineHeight: const LineHeight(1.5),
                      textAlign: TextAlign.justify,
                    )
                  },
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
