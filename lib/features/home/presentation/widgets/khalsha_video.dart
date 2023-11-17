import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khalsha/features/home/presentation/get/controllers/controller.dart';

class KhalshaVideo extends GetView<HomeController> {
  const KhalshaVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 200,
      child: Obx(
        () => controller.showVideo.value
            ? AspectRatio(
                aspectRatio: controller.videoController.value.aspectRatio,
                child: CachedVideoPlayer(controller.videoController),
              )
            : const SizedBox(),
      ),
    );
  }
}
