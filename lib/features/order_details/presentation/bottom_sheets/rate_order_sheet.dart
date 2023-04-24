import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/inputs_style.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/order_details/presentation/view.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../widgets/custom_button.dart';

class RateOrderSheet extends StatefulWidget {
  const RateOrderSheet(this.user, {Key? key}) : super(key: key);
  final User? user;

  @override
  State<RateOrderSheet> createState() => _RateOrderSheetState();
}

class _RateOrderSheetState extends State<RateOrderSheet> {
  double rate = 5.0;
  TextEditingController rateFieldController = TextEditingController();

  final orderDetailsController = Get.find<OrderDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: ColorManager.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Text(
                    'نأمل انك قد ممرت بتجربة رائعة فى هذا الطلب يمكنك ان تضع تقييمك ل (${widget.user?.name}) مع امكانية اضافة رأيك بكل حيادية ليعرف الاخرين مدي مصداقية التعامل التى مررت بها ونأسف ان كانت بها بعض السلبيات',
                    style: Get.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: Align(
                    alignment: Alignment.center,
                    child: RatingBar.builder(
                      initialRating: rate,
                      minRating: 1,
                      glow: false,
                      itemSize: 50,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: ColorManager.primaryColor,
                      ),
                      onRatingUpdate: (_) => _,
                    ),
                  ),
                ),
                CustomTextField.withBorder(
                  title: 'أكتب رئيك (أجباري)',
                  maxLines: 4,
                  radius: radius,
                ),
              ],
            ),
          ),
          Obx(
            () => orderDetailsController.rateOrderLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.secondaryColor,
                    ),
                  )
                : CustomButton(
                    onTap: () {
                      if (rateFieldController.text.isEmpty) {
                        showAlertMessage('أكتب رئيك (أجباري)');
                        return;
                      }

                      orderDetailsController.rateOrder(
                        rate: rate,
                        feedback: rateFieldController.text,
                      );
                    },
                    width: Get.width,
                    text: 'اضف التقييم',
                  ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    rateFieldController.dispose();
    super.dispose();
  }
}
