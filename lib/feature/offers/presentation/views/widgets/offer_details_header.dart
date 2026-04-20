
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/direction_row.dart';
import 'package:flutter/material.dart';

class OfferDetailsHeader extends StatelessWidget {
  const OfferDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طلب التوصيل #8842',
          style: AppStyle.styleBold13(
            context,
          ).copyWith(color: AppColor.kPrimaryColor),
        ),
        const SizedBox(height: 6),
        const DirectionRow(
          text: 'من: حي النرجس، الرياض',
          icon: Icons.location_on_outlined,
        ),
        SizedBox(height: 4),
        const DirectionRow(
          text: 'إلى: حي الملقا، الرياض',
          icon: Icons.navigation_outlined,
        ),
      ],
    );
  }
}
