import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';

import '../../../orders/domain/entities/order_model.dart';

class FeedBackSheet extends StatelessWidget {
  const FeedBackSheet(this.feedbacks, {Key? key}) : super(key: key);
  final List<FeedbackObj> feedbacks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (_, int index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                feedbacks[index].user?.name ?? '',
                style: const TextStyle(
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )),
              RatingBar.builder(
                initialRating: feedbacks[index].rate?.toDouble() ?? 0.0,
                minRating: 1,
                itemSize: 18,
                ignoreGestures: true,
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
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(feedbacks[index].feedback ?? ''),
          ),
        ],
      ),
      separatorBuilder: (_, __) => const Divider(
        color: ColorManager.greyColor,
      ),
      itemCount: feedbacks.length,
    );
  }
}
