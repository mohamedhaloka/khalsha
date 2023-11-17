import 'package:flutter/material.dart';
import 'package:khalsha/core/utils.dart';

class DisableForEdit extends StatelessWidget {
  const DisableForEdit({
    super.key,
    required this.isDisabled,
    required this.child,
  });
  final bool isDisabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled
          ? () =>
              showAlertMessage('لا يمكنك تعديل قيمة العنصر في حالة تعديل الطلب')
          : null,
      child: IgnorePointer(
        ignoring: isDisabled,
        child: child,
      ),
    );
  }
}
