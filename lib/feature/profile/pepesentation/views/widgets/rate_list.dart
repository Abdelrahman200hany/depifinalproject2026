import 'dart:math';

import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/review_cart.dart';
import 'package:flutter/material.dart';

class RateListwithLimitReviews extends StatelessWidget {
  const RateListwithLimitReviews({super.key, required this.rateList});
  final List<RateEntity> rateList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: min(2, 3),
      itemBuilder: (context, index) => ReviewCard(
        itemRate:rateList[index] ,
      ),
    );
  }
}
