import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/utils.dart' as util;

class AddPhotos extends StatefulWidget {
  const AddPhotos({Key? key, required this.images, this.text,})
      : super(key: key);
  final RxList<File> images;
  final String? text;

  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  @override
  void initState() {
    widget.images.add(File(''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'أضف صور',
              style: Get.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            if (widget.text != null) ...[
              const SizedBox(width: 8),
              Expanded(
                  child: Text(
                (widget.text ?? '').tr,
                style: Get.textTheme.bodySmall!
                    .copyWith(color: ColorManager.greyColor),
              ))
            ]
          ],
        ),
        Obx(() => GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 5),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
              ),
              itemCount: widget.images.length,
              itemBuilder: (_, int index) => InkWell(
                onTap: () => _showTakeImageTypeDialog(index),
                child: Obx(() => Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.lightGreyColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(22)),
                            image: widget.images[index].path == ''
                                ? null
                                : DecorationImage(
                                    image: FileImage(widget.images[index]),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          child: const Center(
                            child: Icon(CupertinoIcons.photo),
                          ),
                        ),
                        if (widget.images[index].path != '')
                          Positioned(
                            top: 0,
                            left: 0,
                            child: InkWell(
                              onTap: () =>
                                  widget.images.remove(widget.images[index]),
                              child: const CircleAvatar(
                                radius: 8,
                                backgroundColor: ColorManager.errorColor,
                                child: Icon(Icons.clear, size: 10),
                              ),
                            ),
                          )
                      ],
                    )),
              ),
            ))
      ],
    );
  }

  Future<void> _showTakeImageTypeDialog(int index) {
    return util.showDialog(
      'take-image-from',
      doneText: 'gallery',
      backTxt: 'camera',
      backColor: ColorManager.secondaryColor,
      onDoneTapped: () => _chooseImage(index, ImageSource.gallery),
      onBackTapped: () => _chooseImage(index, ImageSource.camera),
    );
  }

  void _chooseImage(int index, ImageSource imageSource) async {
    final XFile? pickedImage = await ImagePicker().pickImage(
        imageQuality: 30, source: imageSource, maxWidth: 350, maxHeight: 350,);

    Get.back();
    if (pickedImage == null) return;
    int size = await pickedImage.length();
    if (size > 4000000) {
      util.showAlertMessage('photo-must-be-smaller-than-4mb');
      return;
    }
    widget.images[index] = File(pickedImage.path);
    widget.images.add(File(''));
  }
}
