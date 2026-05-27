import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_details_body.dart';
import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';
import 'package:flutter/material.dart';

class OfferDetailsListBody extends StatelessWidget {
  const OfferDetailsListBody({super.key, required this.offerList});
  final List<DeliveryEntity> offerList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: offerList.length,
      itemBuilder: (context, index) =>
          OfferDetailBody(delivery: offerList[index]),
    );
  }
}
