import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_details_view_body_for_clinet.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewForClinet extends StatelessWidget {
  const OrderDetailsViewForClinet({super.key, required this.orderEntity});
  static const routeName = 'OrderDetailsView';
  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return OrderDetailsViewBodyforClinet(orderItem: orderEntity);
  }
}
