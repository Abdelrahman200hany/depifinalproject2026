import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/widgets/custom_divider.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_details_header.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_details_list_body.dart';
import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';
import 'package:flutter/material.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({
    super.key,
    required this.offers,
    required this.locationFrom,
    required this.locationTo,
    required this.orderId,
    required this.pickupCity,
    required this.deliveryCity,
  });
  final List<DeliveryEntity> offers;
  final String locationFrom, locationTo, orderId, pickupCity, deliveryCity;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(16),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColor.kPrimaryColor.withValues(alpha: 0.15)),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: AppColor.kPrimaryColor.withValues(alpha: 0.05),
      collapsedBackgroundColor: AppColor.kPrimaryColor.withValues(alpha: 0.05),

      title: OfferDetailsHeader(
        deliveryCity: deliveryCity,
        pickupCity: pickupCity,
        locationFrom: locationFrom,
        locationTo: locationTo,
        orderId: orderId,
      ),

      children: [
        CustomDivider(),
        OfferDetailsListBody(offerList: offers),
      ],
    );
  }
}
