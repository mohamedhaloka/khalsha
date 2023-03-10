import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootAppBar extends StatelessWidget {
  const RootAppBar({
    Key? key,
    required this.text,
    required this.scaffoldKey,
  }) : super(key: key);
  final String text;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: scaffoldKey.currentState!.openEndDrawer,
          icon: Directionality(
              textDirection: TextDirection.ltr,
              child: SvgPicture.asset('assets/images/icons/drawer-icon.svg'))),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/images/icons/profile.svg'),
          ),
        )
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }
}
