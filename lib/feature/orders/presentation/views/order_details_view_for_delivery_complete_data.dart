
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_details_view_body_for_delivery_with_complete_data.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewForDeliverycompleteData extends StatelessWidget {
  const OrderDetailsViewForDeliverycompleteData({
    super.key,
    required this.item,
  });
  final OrderEntity item;
  static const routeName = 'OrderDetailsViewForDeliverycompleteData';

  @override
  Widget build(BuildContext context) {
    return OrderDetailsViewBodyForDeliverycompleteData(item: item);
  }
}
