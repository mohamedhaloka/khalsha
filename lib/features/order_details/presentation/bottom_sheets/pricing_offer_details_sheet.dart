import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/order_details/presentation/bottom_sheets/feedback_sheet.dart';
import 'package:khalsha/features/order_details/presentation/bottom_sheets/shipment_details_sheet.dart';
import 'package:khalsha/features/order_details/presentation/view.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';
import 'package:khalsha/features/rule/data/models/rule_type_enum.dart';
import 'package:khalsha/features/widgets/cached_image.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

class PricingOfferDetailsSheet extends StatefulWidget {
  const PricingOfferDetailsSheet(this.offer, {Key? key}) : super(key: key);
  final OfferModel offer;

  @override
  State<PricingOfferDetailsSheet> createState() =>
      _PricingOfferDetailsSheetState();
}

class _PricingOfferDetailsSheetState extends State<PricingOfferDetailsSheet> {
  final orderDetailsController = Get.find<OrderDetailsController>();

  bool acceptTerms = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CachedImage(
                  imgUrl: HttpService.fileBaseURL +
                      (widget.offer.user?.photoProfile ?? ''),
                  height: 110,
                  width: Get.width,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.offer.user?.name ?? '',
                        style: Get.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: double.tryParse(
                            widget.offer.user?.ratingsOverall ?? '0.0',
                          ) ??
                          0.0,
                      minRating: 1,
                      ignoreGestures: true,
                      itemSize: 18,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: ColorManager.primaryColor,
                      ),
                      onRatingUpdate: (_) => _,
                    )
                  ],
                ),
                Text(
                  widget.offer.user?.bio ?? '',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset('assets/images/price_header.svg'),
                      Text(
                        'إجمالي السعر ${widget.offer.total!} ريال',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'تنوية هناك رسوم آخرى بالعملية اللوجستية',
                  style: Get.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.secondaryColor,
                  ),
                ),
                ListTile(
                  onTap: () => Get.bottomSheet(
                    HeadLineBottomSheet(
                      bottomSheetTitle: 'تفاصيل الشحنة',
                      body: ShipmentDetailsSheet(widget.offer.data),
                      height: Get.height / 1.3,
                    ),
                    isScrollControlled: true,
                  ),
                  title: const Text('تفاصيل الشاحنة'),
                  subtitle: const Text('عرض تفاصيل عملية النقل من هنا'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
                ListTile(
                  onTap: () => Get.bottomSheet(
                    HeadLineBottomSheet(
                      bottomSheetTitle: 'أراء العملاء',
                      body: FeedBackSheet(
                        widget.offer.user?.feedbacks ?? [],
                      ),
                      height: Get.height / 1.3,
                    ),
                    isScrollControlled: true,
                  ),
                  title: const Text('التقييم'),
                  subtitle: const Text('عرض آراء و تقييمات العملاء من هنا'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => setState(() => acceptTerms = !acceptTerms),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: acceptTerms
                          ? ColorManager.primaryColor
                          : Colors.white,
                      border: Border.all(color: Colors.grey[800]!)),
                  child: const Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'أقر انا علي قراءتي',
                      children: [
                        TextSpan(
                          text: ' للشروط والأحكام ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(
                                  Routes.rule,
                                  arguments: RuleType.termsAndConditions,
                                ),
                          style: const TextStyle(
                            color: ColorManager.secondaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const TextSpan(text: 'والموافقة عليها.')
                      ],
                    ),
                    style: const TextStyle(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Obx(
            () => orderDetailsController.offerActionLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primaryColor,
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'قبول الطلب',
                          onTap: () {
                            if (!acceptTerms) return;
                            orderDetailsController.acceptOrReject(
                              _OfferActionStatus.accepted.name,
                              offerId: widget.offer.id,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CustomButton(
                          text: 'رفض الطلب',
                          onTap: () {
                            if (!acceptTerms) return;
                            orderDetailsController.acceptOrReject(
                              _OfferActionStatus.rejected.name,
                              offerId: widget.offer.id,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}

enum _OfferActionStatus { accepted, rejected }
