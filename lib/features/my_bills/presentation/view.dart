import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/presentation/routes/app_routes.dart';
import '../../../core/presentation/themes/colors_manager.dart';
import '../../orders/presentation/widgets/filter.dart';
import 'get/controllers/controller.dart';

class MyBillsView extends GetView<MyBillsController> {
  const MyBillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Filter(
          margin: EdgeInsets.all(20),
        ),
        const _Header(),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) => _MyBillItem(index),
          separatorBuilder: (_, __) => const Divider(height: 0),
          itemCount: 6,
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      color: ColorManager.lightGrey2Color,
      child: Row(
        children: [
          _buildColumnHeader('اسم الشحنة'),
          _buildColumnHeader('مقدم الخدمة'),
          _buildColumnHeader('الحالة'),
        ],
      ),
    );
  }

  Widget _buildColumnHeader(String text) => Expanded(
        child: Text(
          text,
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorManager.secondaryColor,
          ),
        ),
      );
}

class _MyBillItem extends StatelessWidget {
  const _MyBillItem(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.billDetails),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            _buildRowItem('#$index أثاث منزلي'),
            _buildRowItem('شركة الحمدان'),
            _buildStatus(index),
          ],
        ),
      ),
    );
  }

  Widget _buildRowItem(String text) => Expanded(
        child: Text(
          text,
          style: Get.textTheme.bodySmall!.copyWith(
            color: Colors.black,
          ),
        ),
      );

  Widget _buildStatus(int index) => Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: index.isOdd
                  ? ColorManager.lightGreyColor
                  : ColorManager.skyColor,
            ),
            child: Text(
              index.isOdd ? 'تــمـت' : 'قيد الإنتظار',
              style: Get.textTheme.bodySmall!.copyWith(
                color: index.isOdd ? Colors.black : Colors.blue,
              ),
            ),
          ),
        ),
      );
}
