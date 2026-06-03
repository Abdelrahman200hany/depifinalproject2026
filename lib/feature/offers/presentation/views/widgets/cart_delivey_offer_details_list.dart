
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/cart_delivery_offer_details.dart';
import 'package:flutter/material.dart';

class CartDeliveryOfferDetailsList extends StatelessWidget {
  const CartDeliveryOfferDetailsList({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 2),
        child: CartDeliveryOfferDetails(order: orders[index]),
      ),
    );
  }
}
