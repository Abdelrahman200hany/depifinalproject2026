import 'package:depifinalproject/core/consts/consts.dart';

import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_details.dart';
import 'package:flutter/material.dart';

class OfferViewBody extends StatelessWidget {
  const OfferViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'عروض المناديب'),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) =>
              Padding(padding: EdgeInsets.only(bottom: 12,top: 2), child: OfferDetails()),
        ),
      ),
    );
  }
}
