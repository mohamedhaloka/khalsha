import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_button.dart';

class ChooseDateTimeSheet extends StatefulWidget {
  const ChooseDateTimeSheet({Key? key}) : super(key: key);

  @override
  State<ChooseDateTimeSheet> createState() => _ChooseDateTimeSheetState();
}

class _ChooseDateTimeSheetState extends State<ChooseDateTimeSheet> {
  PageController pageController = PageController();

  int currentStep = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (int index) {
                currentStep = index;
                setState(() {});
              },
              children: [
                // CalenderView(
                //   onDateChanged: (_) => _,
                // ),
                const _TimeView(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: CustomButton(
              height: inputHeight,
              width: 100,
              radius: radius,
              text: currentStep == 0 ? 'التالي' : 'تأكيد',
              onTap: () {
                if (currentStep == 1) {
                  Get.back();
                  return;
                }
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CalenderView extends StatelessWidget {
  const CalenderView({
    Key? key,
    required this.onDateChanged,
    required this.initialDate,
  }) : super(key: key);
  final ValueChanged<DateTime> onDateChanged;
  final DateTime initialDate;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Get.theme.primaryColor,
        onPrimary: Colors.white,
        secondary: Colors.black,
        onSecondary: Colors.black,
        error: Colors.black,
        onError: Colors.black,
        background: Colors.black,
        onBackground: Colors.black,
        surface: Colors.black,
        onSurface: Get.theme.primaryColor,
      )),
      child: CalendarDatePicker(
        initialDate: initialDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        onDateChanged: onDateChanged,
      ),
    );
  }
}

class _TimeView extends StatelessWidget {
  const _TimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Divider(
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _AMPMSwitcher(),
            CustomTextField(
              width: inputHeight + 25,
              padding: EdgeInsets.zero,
              fillColor: ColorManager.lightGrey2Color,
              borderSide: BorderSide.none,
              maxLength: 2,
              radius: radius,
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                ":",
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            CustomTextField(
              width: inputHeight + 25,
              padding: EdgeInsets.zero,
              fillColor: ColorManager.lightGrey2Color,
              borderSide: BorderSide.none,
              maxLength: 2,
              radius: radius,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}

class _AMPMSwitcher extends StatefulWidget {
  const _AMPMSwitcher({Key? key}) : super(key: key);

  @override
  State<_AMPMSwitcher> createState() => _AMPMSwitcherState();
}

class _AMPMSwitcherState extends State<_AMPMSwitcher> {
  RxString currentTime = 'AM'.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(radius)),
        border: Border.all(
          color: ColorManager.lightGreyColor,
        ),
      ),
      child: Obx(() => Row(
            children: [
              _buildTime(
                text: 'PM',
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
              ),
              Container(
                width: .5,
                height: 50,
                color: ColorManager.lightGreyColor,
              ),
              _buildTime(
                text: 'AM',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildTime({
    required String text,
    required BorderRadius borderRadius,
  }) =>
      Expanded(
        child: InkWell(
          onTap: () => currentTime(text),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: currentTime.value == text
                  ? Get.theme.primaryColor
                  : Colors.transparent,
            ),
            child: Center(
                child: Text(
              text,
              style: Get.textTheme.bodyMedium!.copyWith(
                color: currentTime.value == text ? Colors.white : null,
              ),
            )),
          ),
        ),
      );
}
