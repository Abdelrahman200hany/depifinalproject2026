
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_details_body.dart';
import 'package:flutter/material.dart';

class OfferDetailsListBody extends StatelessWidget {
  const OfferDetailsListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) => OfferDetailBody(),
    );
  }
}
