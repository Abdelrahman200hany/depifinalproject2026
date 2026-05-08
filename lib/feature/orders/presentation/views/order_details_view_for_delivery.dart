import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_details_view_body_for_delivery.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewForDelivery extends StatelessWidget {
  const OrderDetailsViewForDelivery({super.key, required this.orderitem});
  static const routeName = 'OrderDetailsViewForDelivery';
  final OrderEntity orderitem;

  @override
  Widget build(BuildContext context) {
    return const OrderDetailsViewBodyForDelivery();
  }
}
