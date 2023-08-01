import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../get/controllers/controller.dart';

class KhalshaVideo extends GetView<HomeController> {
  const KhalshaVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 200,
      child: controller.showVideo.value
          ? AspectRatio(
              aspectRatio: controller.videoController.value.aspectRatio,
              child: VideoPlayer(controller.videoController),
            )
          : const SizedBox(),
    );
  }
}
