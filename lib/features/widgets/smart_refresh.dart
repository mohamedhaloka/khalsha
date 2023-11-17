import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';

class SmartRefresh extends StatelessWidget {
  const SmartRefresh(
      {this.child,
      this.footer,
      this.onLoading,
      this.onRefresh,
      this.waterDropColor,
      this.idleIconColor,
      this.controller,
      Key? key})
      : super(key: key);
  final Widget? child;
  final bool? footer;
  final Function? onRefresh, onLoading;
  final RefreshController? controller;
  final Color? waterDropColor;
  final Color? idleIconColor;
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: footer!,
      header: WaterDropHeader(
        waterDropColor: waterDropColor ?? Theme.of(context).primaryColor,
        idleIcon: Icon(
          Icons.autorenew,
          size: 15,
          color: idleIconColor ?? Colors.white,
        ),
        complete: refreshStatue('refresh-complete'.tr, Icons.done),
        failed: refreshStatue('refresh-failed'.tr, Icons.close),
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text('pull-up-load'.tr);
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text('load-failed-click-try'.tr);
          } else if (mode == LoadStatus.canLoading) {
            body = Text('release-load-more'.tr);
          } else {
            body = Text('no-more-data'.tr);
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: controller!,
      onRefresh: () {
        onRefresh!.call();
      },
      onLoading: () {
        onLoading!.call();
      },
      child: child,
    );
  }

  Widget refreshStatue(String refreshStatue, IconData icon) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
          ),
          Container(
            width: 15.0,
          ),
          Text(
            refreshStatue,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );
}
