import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/review_cart.dart';
import 'package:flutter/material.dart';

class RateListWithAllReview extends StatelessWidget {
  const RateListWithAllReview({super.key, required this.rateList});
  static const String routeName = 'RateListWithAllReview';
  final List<RateEntity> rateList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'كل التقيمات', wantedIconBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: ListView.builder(
          itemCount: rateList.length,
          itemBuilder: (context, index) =>
              ReviewCard(itemRate: rateList[index]),
        ),
      ),
    );
  }
}
