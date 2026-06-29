import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/accept_delivey_offer_buttom.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/reject_delivery_offer_buttom.dart';
import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';
import 'package:flutter/material.dart';

class OfferDetailBody extends StatelessWidget {
  const OfferDetailBody({
    super.key,
    required this.delivery,
    required this.order,
  });
  final DeliveryEntity delivery;
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(delivery.driver.imageUrl),
          ),

          title: Text(
            delivery.driver.name,
            style: AppStyle.styleBold16(context).copyWith(color: Colors.black),
          ),

          subtitle: Row(
            children: [
              Icon(Icons.star, size: 16, color: Colors.amber),
              SizedBox(width: 4),
              Text('4.8', style: AppStyle.styleSRegular12(context)),
            ],
          ),

          trailing: Text(
            '${delivery.proposedPrice} جنيه',
            style: AppStyle.styleBold13(
              context,
            ).copyWith(color: AppColor.kPrimaryColor),
          ),
        ),

        const SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              AccectDeliveryOfferButtom(order: order, delivery: delivery),

              SizedBox(width: 16),
              RejectDeliveryOfferButtom(order: order, delivery: delivery),
            ],
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}
