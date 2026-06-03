import 'package:depifinalproject/core/methods/cut_srting.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/direction_row.dart';
import 'package:flutter/material.dart';

class OfferDetailsHeader extends StatelessWidget {
  const OfferDetailsHeader({
    super.key,
    required this.locationFrom,
    required this.locationTo,
    required this.orderId,
    required this.pickupCity,
    required this.deliveryCity,
  });
  final String locationFrom, locationTo, orderId, pickupCity, deliveryCity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طلب التوصيل #${cutString(orderId, maxLength: 12)}',
          style: AppStyle.styleBold13(
            context,
          ).copyWith(color: AppColor.kPrimaryColor),
        ),
        const SizedBox(height: 6),
        DirectionRow(
          text: 'من:  ${cutString(pickupCity, maxLength: 12)} - $locationFrom',
          icon: Icons.location_on_outlined,
        ),
        SizedBox(height: 4),
        DirectionRow(
          text:
              'إلى:   ${cutString(deliveryCity, maxLength: 12)} - $locationTo',
          icon: Icons.navigation_outlined,
        ),
      ],
    );
  }
}


