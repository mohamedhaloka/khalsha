import 'package:flutter/material.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/cached_image.dart';

class ImagesViewer extends StatefulWidget {
  const ImagesViewer({
    super.key,
    required this.images,
    this.index = 0,
  });
  final List<String> images;
  final int index;

  @override
  ImagesViewerState createState() => ImagesViewerState();
}

class ImagesViewerState extends State<ImagesViewer> {
  PageController pageController = PageController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      pageController.jumpToPage(widget.index);

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InteractiveViewer(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                itemCount: widget.images.length,
                onPageChanged: (i) {},
                controller: pageController,
                itemBuilder: (_, int index) => CachedImage(
                  imgUrl: widget.images[index],
                ),
              ),
            ),
          ),
          Positioned(
              top: 40,
              right: 20,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: ColorManager.secondaryColor)),
                  padding: const EdgeInsets.all(6),
                  child: const RotatedBox(
                      quarterTurns: 2, child: Icon(Icons.arrow_forward_ios)),
                ),
              )),
        ],
      ),
    );
  }
}
