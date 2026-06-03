import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/widgets/custom_divider.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_details_header.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_details_view_for_delivery_complete_data.dart';
import 'package:flutter/material.dart';

class CartDeliveryOfferDetails extends StatelessWidget {
  const CartDeliveryOfferDetails({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.kPrimaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.kPrimaryColor.withValues(alpha: 0.15),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OfferDetailsHeader(
            locationFrom: order.pickupAddress,
            locationTo: order.recipientAddress,
            deliveryCity: order.recipientGovernorate,
            pickupCity: order.pickupGovernorate,
            orderId: order.uIdOrder,
          ),
          const SizedBox(height: 8),

          CustomDivider(),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: CustomTextBottomWithBackground(
                  text: 'عرض التفاصيل ',
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      arguments: order,
                      OrderDetailsViewForDeliverycompleteData.routeName,
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: CustomTextBottomWithBackground(
                  text: 'تغير حاله التوصيل ',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
