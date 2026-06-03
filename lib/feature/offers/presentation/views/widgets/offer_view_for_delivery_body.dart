import 'package:flutter/material.dart';
import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_view_for_delivery_body_bloc_builder.dart';

class OfferViewForDeliveryBody extends StatelessWidget {
  const OfferViewForDeliveryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'عروضك المقبولة'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),

        child: const OfferViewForDeliveryBodyBlocBuilder(),
      ),
    );
  }
}
